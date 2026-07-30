Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69FE2470428
	for <linux-staging@lists.linux.dev>; Thu, 30 Jul 2026 23:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785453210; cv=none; b=tpRr7xse3aPzfvjNzv+CEjhbj39NtSlqykSOp7z9ywl5Gt/08neA3aV6ynxuYiflb1T6qdOqH7S5pWBGfkRNOf0jGvcEtDLiNX4v6Jx5VlLBSqzPnh2kfcwn3ccGsAbXU7YNgz3vC9zEgX3rJU20KNTaT/QoF0g5yF5AF9VpHuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785453210; c=relaxed/simple;
	bh=EHvfDpfxxWUHYnVRRayq7I+H5XtU9cbfpd1Wv3pIpgs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tTgbB/1SkDJM6VzXq/2uI/92G/tbf9nsbp/7CDUvWW+6m7rtf6XvCw/QmnrjMox4LNIa983hRcpipKT1JljdpebKF8pXScN9te4uOHTVQNkqrWOrVAkXGkGwabclyVqhHhfutRo1xF8Ata5C7qO+Ws92FvZSlKoWwpl03Uvq/Yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TDuPdV0i; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TDuPdV0i"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8484f229529so377175b3a.2
        for <linux-staging@lists.linux.dev>; Thu, 30 Jul 2026 16:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785453209; x=1786058009; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RXdvAClsqaKvl5me0t3HAq930Gjdl6GY+XY0N1BhN0E=;
        b=TDuPdV0iqO9wWbi4IH0DYrPEVC1dKt6P5V49dnss5UKWWKQxIcX1EPk+jNq9huZGaE
         iunpFNXAEY6sE77lztATO+aogSzlNEjfjfTr5+AxPdOqOD3gHOBeUQgrUZnCvGdmDpU2
         2e9KNvGojXkBTJ+dmtiG/wfcscyUF2Dc/FLuAj14ngnYKYeLo5vevOrbGWqRkgjxX+XA
         rzEn6ETl4LTY06daGf0tzOEvFDUp0gtIMBi/1q89qQYTrgu7Ml+HUDCv16eG2I3yZFvH
         8k+7BOoB+fSFEw1Qy/in8nnPhnDIOXxvh15S3GypENVNda4La8uk5PPAKHpbDsq74KFx
         y1Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785453209; x=1786058009;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RXdvAClsqaKvl5me0t3HAq930Gjdl6GY+XY0N1BhN0E=;
        b=ThUpiT2r2BoiXnzuvBXd7W2cPM7Dl2qpRBTsjcJIDLMzJyNujU6ssALzRjfyQ6UY+j
         vt7BPHvDkaNzwfhsjVnYAO1fL8betp8R6QAQZSAhxTFuCHfet9dwBkhdJmBUoPfFdyrI
         VbWxO8YzdsMM5LKivJ9BoYCyPEwCk76w/GrcGhb8UvsJzxfGyTX4BK35bb+L0/a94osO
         EYzn3fuTqp7j6ZMcSxZWCAOfFPrFNbAQxbDpk9tr74bWUZh2Yk9TYhlt31+YFtcmyuQs
         zFmDrwWe3rJOi1X8VdX+twR2OFKDtLmafS4WNqrB/pKMe6TSsMo6g73yxWOqeiV68tL/
         CyqA==
X-Gm-Message-State: AOJu0YwYMEALaVxjJfWfs2a0PW9cGiCd7dSrHsvblUPzAm3irB1TVJwZ
	8Es0A3AOr6jflETHnqPU2PhR2agCcetKpssBZc9wFRFgUo57pqPm08Th
X-Gm-Gg: AR+sD10gCIS5OOct/PExYRxEByPJRqsLryxSa4pVd5KyeOiXptH6JrdOslreZ0gTAhv
	tmhu0bsl2oYbSf0agl+XTYazNXHzMi7rXNzEATDr9f7gZd5vRaOcjFCe5SBvqSXRhAlgFcfy3E8
	5Avx17AVtKZhulzpFOFUDrmCl73QeKFRLa5nj4Z6vlJc37Bxy1/QGanA6iID+pFcWVtSdlbS6Bx
	1Hh0MzL33b9g4CSUTYzj2hKLI2Pf+poeYoBkdnt2lXLbZlbNJvoWV7uREwRVMsyLYrWaZnKh3zh
	RZ4RhupBgbsLQsdvhgdj3lly5ILgJ7p0QLYnz77NZkY+SOb4NHnQoFYhzMKf6CuSDSk6E+eA+hS
	R36FmNVSoM2hQOssKo3eclAUKV60+x1IisqUMxZt6DDDLtKDGWG0/7H9UgdkSME+qG3gQOIO+cJ
	k8vi4D5trBsfn/C5e46fR4Xur1WxaXPVX1DgnxOdahZ3tKUSK6JBZlWnOXo6PcUZDCDxmailuIL
	Hpu5HAnlJrCfUJ2Nnpvce8ycgcpklUirGcPiHTycMrw+6a7Xl42nHImdHAJs7vQfQMPIBw=
X-Received: by 2002:a05:6a00:3cd4:b0:845:e9e8:6458 with SMTP id d2e1a72fcca58-84ebc2256aemr4201058b3a.20.1785453208623;
        Thu, 30 Jul 2026 16:13:28 -0700 (PDT)
Received: from bloom.localdomain ([2604:3d09:178e:e100::6868])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e9fe20e35sm3686246b3a.1.2026.07.30.16.13.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 16:13:27 -0700 (PDT)
From: Ivy Lopez <skunkolee@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ivy Lopez <skunkolee@gmail.com>
Subject: [PATCH] staging: rtl8723bs: use kfree_sensitive() for key material in rtw_set_key()
Date: Thu, 30 Jul 2026 17:13:15 -0600
Message-ID: <20260730231315.79688-1-skunkolee@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

psetkeyparm holds WEP/TKIP/AES key material copied in via memcpy
from psecuritypriv before being freed. Use kfree_sensitive() instead
of kfree() so the key bytes are zeroed before the memory is released,
consistent with how psetstakey_para is already handled elsewhere in
this driver.

Signed-off-by: Ivy Lopez <skunkolee@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 1196ec011455..fb45f7295386 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -1926,14 +1926,14 @@ signed int rtw_set_key(struct adapter *adapter, struct security_priv *psecurityp
 		break;
 	default:
 		res = _FAIL;
-		kfree(psetkeyparm);
+		kfree_sensitive(psetkeyparm);
 		goto exit;
 	}
 
 	if (enqueue) {
 		pcmd = kzalloc_obj(*pcmd);
 		if (!pcmd) {
-			kfree(psetkeyparm);
+			kfree_sensitive(psetkeyparm);
 			res = _FAIL;  /* try again */
 			goto exit;
 		}
@@ -1949,7 +1949,7 @@ signed int rtw_set_key(struct adapter *adapter, struct security_priv *psecurityp
 		res = rtw_enqueue_cmd(pcmdpriv, pcmd);
 	} else {
 		setkey_hdl(adapter, (u8 *)psetkeyparm);
-		kfree(psetkeyparm);
+		kfree_sensitive(psetkeyparm);
 	}
 exit:
 	return res;
-- 
2.55.0

