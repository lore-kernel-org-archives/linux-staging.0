Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B534E7C
	for <linux-staging@lists.linux.dev>; Thu, 26 May 2022 12:05:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06229C34119;
	Thu, 26 May 2022 12:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1653566729;
	bh=TfdkWLOcN3N1je1oJ0LOhAUwJ2jCiUxwDTsjIQ7J9lw=;
	h=Subject:To:Cc:From:Date:In-Reply-To:From;
	b=GRay8bGikpkIc8GaNS10osYYaOZ6AMlMNvXoo5bhRBR97IgX6VBx2F4zWpzxFcRj/
	 5I+dGdhNqs8ku2Y1/DRuXn4KxY1BQ8A8PLy5qi4o3S0ggGL6/7ZZJ+H/V7itAAxS8r
	 5A6p+uiyCUtmfu/fqTQl6mwGDUzPb0oSJV4we/ko=
Subject: Patch "staging: rtl8723bs: prevent ->Ssid overflow in rtw_wx_set_scan()" has been added to the 4.14-stable tree
To: Larry.Finger@lwfinger.net,dan.carpenter@oracle.com,efremov@linux.com,gregkh@linuxfoundation.org,linux-staging@lists.linux.dev,phil@philpotter.co.uk,straube.linux@gmail.com
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Thu, 26 May 2022 14:05:26 +0200
In-Reply-To: <20220523173943.12486-1-efremov@linux.com>
Message-ID: <1653566726179181@kroah.com>
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

to the 4.14-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     staging-rtl8723bs-prevent-ssid-overflow-in-rtw_wx_set_scan.patch
and it can be found in the queue-4.14 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From efremov@linux.com  Thu May 26 14:03:14 2022
From: "Denis Efremov (Oracle)" <efremov@linux.com>
Date: Mon, 23 May 2022 21:39:43 +0400
Subject: staging: rtl8723bs: prevent ->Ssid overflow in rtw_wx_set_scan()
To: gregkh@linuxfoundation.org
Cc: "Denis Efremov (Oracle)" <efremov@linux.com>, Larry.Finger@lwfinger.net, phil@philpotter.co.uk, dan.carpenter@oracle.com, straube.linux@gmail.com, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, stable <stable@vger.kernel.org>
Message-ID: <20220523173943.12486-1-efremov@linux.com>

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
@@ -1438,9 +1438,11 @@ static int rtw_wx_set_scan(struct net_de
 
 					sec_len = *(pos++); len-= 1;
 
-					if (sec_len>0 && sec_len<=len) {
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

queue-4.14/staging-rtl8723bs-prevent-ssid-overflow-in-rtw_wx_set_scan.patch
