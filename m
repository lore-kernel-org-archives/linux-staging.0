Received: from smtp-relay-canonical-1.canonical.com (smtp-relay-canonical-1.canonical.com [185.125.188.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F51D168
	for <linux-staging@lists.linux.dev>; Fri,  9 Jul 2021 14:59:46 +0000 (UTC)
Received: from [10.172.193.212] (1.general.cking.uk.vpn [10.172.193.212])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id A51A540328;
	Fri,  9 Jul 2021 14:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1625842419;
	bh=4GllOhi0bU4HT201lnlv9sAuBWdVEdHATn3w+UM+LZk=;
	h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type;
	b=gu6YzG1prTLHJ6Uoouinep/7z2DEqDTjIuJBmuHldUWtwY6t763H6v/KcTwO6tHT3
	 91vcPo4kLvlu59x54pshqnzWVISiZpCtnICCvxC6TMgzdyMrVRrQc+5x2vWE3LccOx
	 g6jQRb0PrDF2SHpM5yNmtjBgBW4u5JIij/aWhUPjvJ0fxyMlq9PYSaGH3Ainc0H+t8
	 A9XAShb0WzmFXv57YqCdzHuR7wFAZjRMs9QkPz1aO2fHS7JNkrbjOJitW8z4Z4RufW
	 PHuUl4JNGNuIhWJbgSPm75MiINRC2rwXcCUIpfNNK/URn2fYNoHomCkLau/fODF/xC
	 KxxLO3ll+Rtww==
To: Quytelda Kahja <quytelda@tamalin.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
From: Colin Ian King <colin.king@canonical.com>
Subject: staging: rtl8723bs mask values in wpa_set_auth_algs
Message-ID: <619462ca-e652-30f5-6ffa-3213175d8bbc@canonical.com>
Date: Fri, 9 Jul 2021 15:53:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi,

Static analysis with Coverity has found an issue introduced by the
following commit:

commit 5befa937e8daaebcde81b9423eb93f3ff2e918f7
Author: Quytelda Kahja <quytelda@tamalin.org>
Date:   Tue Mar 27 01:41:02 2018 -0700

    staging: rtl8723bs: Fix IEEE80211 authentication algorithm constants.

The analysis is as follows:

347 static int wpa_set_auth_algs(struct net_device *dev, u32 value)
348 {
349        struct adapter *padapter = rtw_netdev_priv(dev);
350        int ret = 0;
351
352        if ((value & WLAN_AUTH_SHARED_KEY) && (value & WLAN_AUTH_OPEN)) {

Logically dead code (DEADCODE)

353                padapter->securitypriv.ndisencryptstatus =
Ndis802_11Encryption1Enabled;
354                padapter->securitypriv.ndisauthtype =
Ndis802_11AuthModeAutoSwitch;
355                padapter->securitypriv.dot11AuthAlgrthm =
dot11AuthAlgrthm_Auto;
356        } else if (value & WLAN_AUTH_SHARED_KEY)        {
357                padapter->securitypriv.ndisencryptstatus =
Ndis802_11Encryption1Enabled;
358
359                padapter->securitypriv.ndisauthtype =
Ndis802_11AuthModeShared;
360                padapter->securitypriv.dot11AuthAlgrthm =
dot11AuthAlgrthm_Shared;
   dead_error_condition: The condition value & 0U cannot be true.
361        } else if (value & WLAN_AUTH_OPEN) {
362                /* padapter->securitypriv.ndisencryptstatus =
Ndis802_11EncryptionDisabled; */

Logically dead code (DEADCODE)

363                if (padapter->securitypriv.ndisauthtype <
Ndis802_11AuthModeWPAPSK) {
364                        padapter->securitypriv.ndisauthtype =
Ndis802_11AuthModeOpen;
365                        padapter->securitypriv.dot11AuthAlgrthm =
dot11AuthAlgrthm_Open;
366                }
367        } else {
368                ret = -EINVAL;
369        }
370
371        return ret;
372
373 }

The deadcode warnings occur because the mask value of WLAN_AUTH_OPEN is
defined in /include/linux/ieee80211.h as:

#define WLAN_AUTO_OPEN 0

and so any value masked with 0 is 0 and hence that part of the if
statement is always false.

The original code was using the mask values:

AUTH_ALG_SHARED_KEY and also AUTH_ALG_OPEN_SYSTEM that are defined as:

#define AUTH_ALG_OPEN_SYSTEM                   0x1
#define AUTH_ALG_SHARED_KEY                    0x2

So this appears to be a regression. I'm not sure the best approach for a
suitable fix to use the intended macros in ieee80211.h

Colin



