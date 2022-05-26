Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33A721380
	for <linux-staging@lists.linux.dev>; Thu, 26 May 2022 12:06:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DE59C34119;
	Thu, 26 May 2022 12:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1653566765;
	bh=HeaFNToJNlUBBnvfUrHW9FPs+114a8TsYX72rTJYXQs=;
	h=Subject:To:Cc:From:Date:In-Reply-To:From;
	b=lZsD5PpeVPvpPLm1KiDTTscy630oSajQVZVjXvgSPlEnagjYC5V3R2tu6AbSVfP5h
	 v5pKlpH2yxkibpGoCQZU8f0BLSw6QWlnfb9wwe/1CMyYKLkLlmOvMMhBgajxoy5Z+Y
	 PP8AwaMmyjIk5v4EyU1imNPSHe6GXkC4SqUCSR+8=
Subject: Patch "staging: rtl8723bs: prevent ->Ssid overflow in rtw_wx_set_scan()" has been added to the 5.10-stable tree
To: Larry.Finger@lwfinger.net,dan.carpenter@oracle.com,efremov@linux.com,gregkh@linuxfoundation.org,linux-staging@lists.linux.dev,phil@philpotter.co.uk,straube.linux@gmail.com
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Thu, 26 May 2022 14:05:57 +0200
In-Reply-To: <20220520035730.5533-1-efremov@linux.com>
Message-ID: <165356675768197@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 


This is a note to let you know that I've just added the patch titled

    staging: rtl8723bs: prevent ->Ssid overflow in rtw_wx_set_scan()

to the 5.10-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     staging-rtl8723bs-prevent-ssid-overflow-in-rtw_wx_set_scan.patch
and it can be found in the queue-5.10 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From efremov@linux.com  Thu May 26 14:03:56 2022
From: "Denis Efremov (Oracle)" <efremov@linux.com>
Date: Fri, 20 May 2022 07:57:30 +0400
Subject: staging: rtl8723bs: prevent ->Ssid overflow in rtw_wx_set_scan()
To: gregkh@linuxfoundation.org
Cc: "Denis Efremov (Oracle)" <efremov@linux.com>, Larry.Finger@lwfinger.net, phil@philpotter.co.uk, dan.carpenter@oracle.com, straube.linux@gmail.com, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, stable <stable@vger.kernel.org>
Message-ID: <20220520035730.5533-1-efremov@linux.com>

From: "Denis Efremov (Oracle)" <efremov@linux.com>

This code has a check to prevent read overflow but it needs another
check to prevent writing beyond the end of the ->Ssid[] array.

Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
Cc: stable <stable@vger.kernel.org>
Signed-off-by: Denis Efremov (Oracle) <efremov@linux.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/staging/rtl8723bs/os_dep/ioctl_linux.c |    6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

--- a/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
@@ -1351,9 +1351,11 @@ static int rtw_wx_set_scan(struct net_de
 
 					sec_len = *(pos++); len -= 1;
 
-					if (sec_len > 0 && sec_len <= len) {
+					if (sec_len > 0 &&
+					    sec_len <= len &&
+					    sec_len <= 32) {
 						ssid[ssid_index].SsidLength = sec_len;
-						memcpy(ssid[ssid_index].Ssid, pos, ssid[ssid_index].SsidLength);
+						memcpy(ssid[ssid_index].Ssid, pos, sec_len);
 						/* DBG_871X("%s COMBO_SCAN with specific ssid:%s, %d\n", __func__ */
 						/* 	, ssid[ssid_index].Ssid, ssid[ssid_index].SsidLength); */
 						ssid_index++;


Patches currently in stable-queue which might be from efremov@linux.com are

queue-5.10/staging-rtl8723bs-prevent-ssid-overflow-in-rtw_wx_set_scan.patch
