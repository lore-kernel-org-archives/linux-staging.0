Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9D82411634
	for <linux-staging@lists.linux.dev>; Tue, 31 Mar 2026 15:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774971198; cv=none; b=sslicwK8NNn0wtcSKJsD9gY639mUXXP/PSGIBTGtzPk8PN7hgbxax5NMFDyNnDlu59wW/NBG4KDZ4AQCDFMsthpx0R9mwXRIphqcT+EZrIbj/99XDz7GEOiIhIEZ7KKYY1oqXLqiEQajVCFC+kI8ZGokZg5c/UgSjKZjEeAYKO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774971198; c=relaxed/simple;
	bh=TtQ2GqKrVJlkDKD9m04qBC10J5egInIEBw71Ss4M2QM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KsFcf4oEEPyNQAZyciBuaTtSajI47E6pvWb2V+rl0FYKDfIC9pcFKNI8plpEdeo3EEEdtByeDyS6C+se1VuKjelc1StgQG/I8d1ferGtgJjxGtisMtM7mDjAyyG+XSfZBkSeBx+NFiG1QSWiSucXa2GFMT//btMcb6+/9aW8fDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rf2W+GNH; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rf2W+GNH"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4887ca8e529so49745e9.0
        for <linux-staging@lists.linux.dev>; Tue, 31 Mar 2026 08:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774971184; x=1775575984; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AFyRFKei9suLL4OspDT72haNVF/dIBE9vkd1iIbltuA=;
        b=rf2W+GNHLHgy4gzPtATeIRsRNBHinrPnWs7P914eVYY9yXuuhrVufSTK0V4jTfp1RS
         P/H8jOKWoIJomP9DDegHPBKUILvpbp89EZvuBx7psJn4b5zuXZp4dkLoCIazv0iTYDkt
         AsPt4hC4Py8ZZn24QppFWoSqySLpnk39YFEQ7+pmA8A7U5p1JYIRF/ha/imjkWAPZeCV
         SPhnSYvHT3TUJ5VDwvUtm4eoRJweTILLz/50hMgzODallKxC/eYmy/zqt2jFL/8r1Yw5
         jESXq7pHnBEgQW/QiFrc2le82A3VrEvJlUi/vxda3gp/fPy4VKjanoD4n4Mevfxf2iqH
         FEQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774971184; x=1775575984;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AFyRFKei9suLL4OspDT72haNVF/dIBE9vkd1iIbltuA=;
        b=j+w5wHFQcT3wky1k69sq1vBLAXLE/AEYnJCZ8j1ZcAOIMJjZlKG5tx5MWLuOPq2+Gi
         gncRxmyDkBLELV7FZRcgJjOaKo2QpSWwCCorJoVfux7OZ983B4+pI37pXYSlDAewaUoG
         b3XK6rCKXPm0I6yyNyjsSjjEAivgZ69KUVX7SexVDgAx5AXF83lQQ9/IpUOmtRwfcCwy
         ObxMUwv7lfDUgznkXgPsrq98i2oo0365NUZH19riH5/ShxdxGqLwH4skJG6DBtwTzMMB
         3pRlZ813+zkzavBrAriZaeWfeYYcC/31D0LS2AvzmKDTwENA189Fy3zdqAu+lYQjMF81
         /o/w==
X-Gm-Message-State: AOJu0YwXT06V2uNGjhuXBExoE3xA1AZpeABIVmgMeo7KYPBMJbyuUJDY
	Bw9RtwBiLWn4bBAp6lfVxy4foGJL6YS706t2GXmRBxdy5I90gIELJGgf
X-Gm-Gg: ATEYQzxoZLC7fglg3XhdkczdGR/nl7KQlW8oWRXaawJEIMNfefA3NoWL+3hbyhDLMLu
	ksREvI4qQrk/TYHEQzplhNhyg/aqeLrxV4Ch7J9iIKkAUzJh49MTuPzbADCIkPKqibH63PDkZj1
	72R1S8m9F0WJnmf/X5EbCOhcHifxrdZ4AcQShRPHKVNEhP1cMNexXAd20CkBrPtLWtBKot5PnP8
	XmmS00/ra1EUBuqs6sk5SWgesY+tRAjJDyu83LuxPTUHie9SkCUd967wG0OtxpiHzsozVOa8Vl2
	shC1gh8cSPigpXnMK/PCyYPtQz4F20e3KuskAO8KVhi636EVRCZIR4NDakEOzQVN7p1dwZq51GR
	vICv1CFbQmcqFeRu0ZLaCvdfO9ozF2VJufK/O9On0AS+mTSIkcV0UZrgKnOAvDFQ6nyXOJggD+5
	FboERE3mt7CVbOPryww6uWrw==
X-Received: by 2002:a05:600c:83c3:b0:485:3428:774c with SMTP id 5b1f17b1804b1-48878281a4cmr70175035e9.4.1774971184157;
        Tue, 31 Mar 2026 08:33:04 -0700 (PDT)
Received: from potato ([31.176.162.65])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887aceb230sm21653485e9.4.2026.03.31.08.33.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 08:33:03 -0700 (PDT)
From: Omer El Idrissi <omer.e.idrissi@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Omer El Idrissi <omer.e.idrissi@gmail.com>
Subject: [PATCH 1/5] staging: rtl8723bs: use direct returns in rtw_sdio_if1_init
Date: Tue, 31 Mar 2026 17:32:50 +0200
Message-ID: <20260331153255.22764-2-omer.e.idrissi@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260331153255.22764-1-omer.e.idrissi@gmail.com>
References: <20260331153255.22764-1-omer.e.idrissi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clean up rtw_sdio_if1_init to use direct returns for the sake of
readability.

Signed-off-by: Omer El Idrissi <omer.e.idrissi@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c | 29 ++++++++------------
 1 file changed, 11 insertions(+), 18 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
index d664e254912c..64618632ee78 100644
--- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
+++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
@@ -224,14 +224,13 @@ static void sd_intf_stop(struct adapter *padapter)
 
 static struct adapter *rtw_sdio_if1_init(struct dvobj_priv *dvobj, const struct sdio_device_id  *pdid)
 {
-	int status = _FAIL;
 	struct net_device *pnetdev;
 	struct adapter *padapter = NULL;
 	struct sdio_data *psdio = &dvobj->intf_data;
 
 	padapter = vzalloc(sizeof(*padapter));
 	if (!padapter)
-		goto exit;
+		return NULL;
 
 	padapter->dvobj = dvobj;
 	dvobj->if1 = padapter;
@@ -289,27 +288,21 @@ static struct adapter *rtw_sdio_if1_init(struct dvobj_priv *dvobj, const struct
 
 	rtw_hal_disable_interrupt(padapter);
 
-	status = _SUCCESS;
+	return padapter;
 
 free_hal_data:
-	if (status != _SUCCESS && padapter->HalData)
-		kfree(padapter->HalData);
+	kfree(padapter->HalData);
 
-	if (status != _SUCCESS) {
-		rtw_wdev_unregister(padapter->rtw_wdev);
-		rtw_wdev_free(padapter->rtw_wdev);
-	}
+	rtw_wdev_unregister(padapter->rtw_wdev);
+	rtw_wdev_free(padapter->rtw_wdev);
 
 free_adapter:
-	if (status != _SUCCESS) {
-		if (pnetdev)
-			rtw_free_netdev(pnetdev);
-		else
-			vfree((u8 *)padapter);
-		padapter = NULL;
-	}
-exit:
-	return padapter;
+	if (pnetdev)
+		rtw_free_netdev(pnetdev);
+	else
+		vfree((u8 *)padapter);
+
+	return NULL;
 }
 
 static void rtw_sdio_if1_deinit(struct adapter *if1)
-- 
2.51.0

