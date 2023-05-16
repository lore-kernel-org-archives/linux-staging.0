Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CCB68482
	for <linux-staging@lists.linux.dev>; Tue, 16 May 2023 19:22:11 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-50a20bfe366so3625748a12.0
        for <linux-staging@lists.linux.dev>; Tue, 16 May 2023 12:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684264929; x=1686856929;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UqYmiFpnnKS2pZzuywUQLIWdUuVLhrzS65V3MwC8BCk=;
        b=o5VVC7QzFfDoyZpW+Y2Riq9ctct1CawLq3uuhNOD+CrOi54jxa+yVtRDV39on76lfn
         xphFvH7wpVf7icOkSSJkD+2ddptAsSWsk2QVBrtdURIj+/TdvCJnqh86Uc5roX0krEmw
         tmcor1wUxOwfBPXFOpiEtHsvXVINjz0TZoIRGddR1BvQwDDGVRMdumMC6v3juXWLovkh
         DxdkNbf0ea21ZYopaFvp4dxWc8OQIXAfmk2915Dvj7gfVcDf0YF0X3gDjbAwlfSCpZzp
         YyKVRtLUXtRE0jlBljAbHCsWk0yIbEa5cQNUm5x7UDdqsX3oxzTdqPkA1WyjyAiaPW0N
         6s4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684264929; x=1686856929;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UqYmiFpnnKS2pZzuywUQLIWdUuVLhrzS65V3MwC8BCk=;
        b=Qb363XCRfnrwmsdI/Sna+qAKnXEcLoT+Q0bZ3XxiTMFXsve6lhKxDrDfoNK5mSKPSV
         +FIn/qBo5ZWi5et3Qm+N4U0pLb/LnSEthoQW2sQLYvisJTqhOpEswDjscMxH/aESYcJN
         FSc5Gg5d5IVedCsGGawl+Z/LRO/48aGi9PdAgo838B2x+gwRve9S+KUx6FguyasYagru
         EpNm61R/WzWTG4wLjbx81s3MudLj0wGccUZRAMdX+vtYGS3+WvEY+s5WcF1kELpjFUnO
         8y1gxHcTjJGQtAOGP6DKhPR0yFNOFvCi/kupBuWb5qV+26kgucEHpTx0DSsznS0yZa6A
         yAIQ==
X-Gm-Message-State: AC+VfDxK7sdtGuYMe2aAjsXZzJv4riDT5zl3BfKBXSOKSIcq+ckFVIjN
	yqnvOhL0vp6wwBJ+pvZLCYc=
X-Google-Smtp-Source: ACHHUZ5/4utux9EbmWMKPnBznFeCkNCwoIbZ0MXCeWg3Wa7ayTfOav+nofbciJC+8Y+i9WMTSCkOlA==
X-Received: by 2002:a05:6402:40cb:b0:50b:c57f:d464 with SMTP id z11-20020a05640240cb00b0050bc57fd464mr638864edb.1.1684264929203;
        Tue, 16 May 2023 12:22:09 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57935e01.dip0.t-ipconnect.de. [87.147.94.1])
        by smtp.gmail.com with ESMTPSA id f14-20020a05640214ce00b0050e04125a46sm5587846edx.10.2023.05.16.12.22.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 May 2023 12:22:08 -0700 (PDT)
Date: Tue, 16 May 2023 21:22:06 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8192e: Unlock wx_mutex not in rtllib_wx_set_scan
Message-ID: <20230516192206.GA7710@matrix-ESPRIMO-P710>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On start of rtllib_wx_set_scan lock was taken with
mutex_lock(&ieee->wx_mutex). Unlocking was done at the end of
schedule_work(&ieee->wx_sync_scan_wq) which lead to the error "lock held
when returning to user space!". Pushing lock to beginning of
ieee->wx_sync_scan_wq to improve overview. Removed lock from
rtllib_wx_set_scan as ieee->state, ieee->iw_mode and ieee->proto_started
are not protected in many other places.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
Tested with rtl8192e (WLL6130-D99)
Transferred this patch over wlan connection of rtl8192e

[ 7379.147691] ================================================
[ 7379.147693] WARNING: lock held when returning to user space!
[ 7379.147694] 6.3.0+ #8 Tainted: G         C OE
[ 7379.147696] ------------------------------------------------
[ 7379.147697] wpa_supplicant/1193 is leaving the kernel with locks still held!
[ 7379.147699] 1 lock held by wpa_supplicant/1193:
[ 7379.147701]  #0: ffff8c54dd0090b0 (&ieee->wx_mutex){+.+.}-{4:4}, at: rtllib_wx_set_scan+0x22/0x80 [rtllib]
---
 drivers/staging/rtl8192e/rtllib_softmac_wx.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_softmac_wx.c b/drivers/staging/rtl8192e/rtllib_softmac_wx.c
index 371864f0087f..e93da95f175b 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac_wx.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac_wx.c
@@ -332,6 +332,7 @@ void rtllib_wx_sync_scan_wq(void *data)
 	enum ht_channel_width bandwidth = 0;
 	int b40M = 0;
 
+	mutex_lock(&ieee->wx_mutex);
 	if (!(ieee->softmac_features & IEEE_SOFTMAC_SCAN)) {
 		rtllib_start_scan_syncro(ieee, 0);
 		goto out;
@@ -404,8 +405,6 @@ int rtllib_wx_set_scan(struct rtllib_device *ieee, struct iw_request_info *a,
 {
 	int ret = 0;
 
-	mutex_lock(&ieee->wx_mutex);
-
 	if (ieee->iw_mode == IW_MODE_MONITOR || !(ieee->proto_started)) {
 		ret = -1;
 		goto out;
@@ -418,7 +417,6 @@ int rtllib_wx_set_scan(struct rtllib_device *ieee, struct iw_request_info *a,
 	}
 
 out:
-	mutex_unlock(&ieee->wx_mutex);
 	return ret;
 }
 EXPORT_SYMBOL(rtllib_wx_set_scan);
-- 
2.40.1

