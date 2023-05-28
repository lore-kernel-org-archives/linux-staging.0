Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB8E3611A
	for <linux-staging@lists.linux.dev>; Sun, 28 May 2023 18:37:27 +0000 (UTC)
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-38c35975545so1841967b6e.1
        for <linux-staging@lists.linux.dev>; Sun, 28 May 2023 11:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685299047; x=1687891047;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=Sxz/+Nc9167ApWrleeKYEGsyKyqRexgoIRa/vUrynzw=;
        b=KB+aAQGWZdGfApni3zT1E0nCit0GR9uCwihN4JiJeRcwKxa1c64QmtAbbzD4CCKTpf
         FUwRz4rjv2Thu0lYwVC0qKPOlAJNnhqetb6gJg521bYJKkR/RKnMyxrHWmmsVfv3FWrn
         Gs9CdGzzXDOepbHJlfJgMZkxo8ubSgC+PG41A4TnwxzFE+1fU4X9GIca8pMMwS1CK50a
         xgptP8b0DPwPWCaWLO6yi8QtH9Ja/KpdwOJBATg59WQ9+35nzjbEG9UW6WudnMWqp4eq
         s3Z/EAgoEFaM27Ayt55n0igkyUBBEtUq32Vu0CybeFmjYx/A5VlTkfeBea1zBIpgY4B4
         4cHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685299047; x=1687891047;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sxz/+Nc9167ApWrleeKYEGsyKyqRexgoIRa/vUrynzw=;
        b=bmO4HYZDmPioQH9B0p69/W53IWF2+5IXjGswVk/c3Wt/YavPE3MpPr08uoVrrEwVvo
         pzgAxYWuePkEIYfFmuDSiry54TS+glCVfB3+x63A7kwOiMp6oWVqNVClfvQYzIHrScHG
         b4IL8v+SFRdo8SLGFwhyzj2kG69pebxPmoKY5RFPOEUSrydr9s40QWt1tEYnDkBMG0sl
         MXXBjTdShxwxkk+aTJXVxuChwSnzN3yNUu01xwcSMOGHHtWevlYFvvHrDFI8u02eMDbI
         Kq0FM+6gnQsWHq/d8nNnOHl+lnnCVYBk1z2z60XCO3rcEztL8sfKm2fXHKZy/jvvkfzB
         wOvQ==
X-Gm-Message-State: AC+VfDxkgB6mVumRouCnWrJX4IsKsPaovTjfUB0A6ZP4S2c9+BHwVl9I
	Qhym4fUI934UxcI6wnY+cqc=
X-Google-Smtp-Source: ACHHUZ49Fo6RGpHQdq5SBtmkbZW90hiDMAg6W6ahtdcB6s8IfY1u52o+HyoeTa+Eku4aLDO1f8GqIA==
X-Received: by 2002:a05:6808:10d4:b0:396:3b9d:7ee0 with SMTP id s20-20020a05680810d400b003963b9d7ee0mr4595766ois.41.1685299046871;
        Sun, 28 May 2023 11:37:26 -0700 (PDT)
Received: from [192.168.0.200] ([216.130.59.33])
        by smtp.gmail.com with ESMTPSA id v188-20020acadec5000000b0038ee0c3b38esm3947107oig.44.2023.05.28.11.37.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 May 2023 11:37:26 -0700 (PDT)
Sender: Larry Finger <larry.finger@gmail.com>
Message-ID: <0bcc883c-dd71-c6d2-f642-ee1315316c5d@lwfinger.net>
Date: Sun, 28 May 2023 13:37:25 -0500
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: staging: rtl8192e: Replace drivers rtllib_crypt_ccmp_... with
 lib80211_crypt_...
Content-Language: en-US
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <cover.1683960684.git.philipp.g.hortmann@gmail.com>
 <e3c29c3db33d314dffb673f8e563da0fb1f2b22f.1683960685.git.philipp.g.hortmann@gmail.com>
 <acac3ff7-36cd-72b4-1857-c8e3588d287f@gmail.com>
From: Larry Finger <Larry.Finger@lwfinger.net>
In-Reply-To: <acac3ff7-36cd-72b4-1857-c8e3588d287f@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/28/23 01:38, Philipp Hortmann wrote:
> Hi,
> 
> it is possible to remove three modules from the staging area by replacing:
> rtllib_crypt_ccmp with lib80211_crypt_ccmp
> rtllib_crypt_tkip with lib80211_crypt_tkip
> rtllib_crypt_wep with lib80211_crypt_wep
> 
> The following issues arise:
> - rtl8192e needs to be switched to software encryption or
>    lib80211_crypt_... needs to be extended with hardware encryption.
> - Performance is dropping on my computer from 12,5MB/s to 1,5MB/s when
>    switching to software encryption.(it does not really change if I use
>    rtllib_crypt_ccmp or lib80211_crypt_ccmp)
> - Fix: rtllib_rx_decrypt: decrypt frame error that occure sometimes on
>    lib80211_crypt_ccmp
> 
> Below the changes on the driver that made use of lib80211_crypt_... possible.
> 
> So the questions are:
> Is it worth the effort or is this going in the wrong direction?
> Does it help the kernel community or is it just creating more effort?
> Why does LIB80211 not support hardware encryption? Or does it?

I do not know why LIB80211 does not support hardware encryption, but the 
performance hit you report is not acceptable!

Larry


