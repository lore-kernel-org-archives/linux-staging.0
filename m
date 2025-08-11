Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54CAE299AB3
	for <linux-staging@lists.linux.dev>; Mon, 11 Aug 2025 06:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754893375; cv=none; b=P8fb4YZZMZjOZHC19Vz1RQjy0nPGXqn0CO/505T3TrYO1mhOEFXQrqE8YzrKXSPmGifaMgj0pg3eZoiLIet65YfYXnaJph9rEVGfBp+utPtgCrcOxjCpcC7rgWQVJxED0CtXYkIAh0M7Q2zE3DId+RKDTnARphI6cz1QTygeMaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754893375; c=relaxed/simple;
	bh=vb944XmRUx1hK1TdfY4vUMaT4mPgrvMgW9KQwecjivM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KTlpZJhFof7SXj6beq/yWbXW6gmjsRdapOTsaxoGfxduSvAV29V5a6qGHSidvYFzZ/qvXJsyi0I8w6m6NFGZXHTvTYvi+IImcHLsEnznzVgSHGS9Oak+CdDlgdOWzpLhA3avzTRKsTfZZHvikHT5tos9a/FHJVqoidwkIhh8/qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RsLaNfwH; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RsLaNfwH"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-76bc55f6612so3506308b3a.0
        for <linux-staging@lists.linux.dev>; Sun, 10 Aug 2025 23:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754893374; x=1755498174; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7+rkNoJTJE6rdyEv/+OSh145DTnxdctDpAvN5QptM8w=;
        b=RsLaNfwHqaN2+KHT9BNUvNZPCbx0xRI342mKnvcbXDM+OX8VFOKo09vSc+M0eazU0y
         5EJ9A3EK+kzP1zsJdSsrUb1Ay817Wfb+KU1ZumPB8sJgZ1NLrPgEvYX0NR/SsTzYmPjj
         /YVolUCMfH4FWBRBUOH08jmwyUwwlwb9lK4CjPd3hlNhMDNMn/cJEeduFQpC9N3uxu8X
         yJe1E6cKoubIY8cJmyj97tRx4v606ByCf2fP+zDBD/T6ScW/Wz8QIwXUJVKx8NeZikFP
         8x9Ys5GRGqGlj8pN/MpZ7+mko5nUYZVTP/oaPQn7iGWs6zFurw7RIREagt6fZHZMxnkc
         rY8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754893374; x=1755498174;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7+rkNoJTJE6rdyEv/+OSh145DTnxdctDpAvN5QptM8w=;
        b=BgFIkc6eZdx19GpEtT6Ag9g+YbwChW4DaVdh9r13rI66sN0VVdONcak6Xg+YTbCYAR
         KN35YGZ8bfkG9Q/1nB4J5b9Fvgso6u2A8+zYrX4fXik/TPtF7fovpP3i8erywdrWQSGQ
         480LaLchhTq9i/oQP2bqkgJJXBJTy5W75zYvd2tYzdhmETOnX2LzaVpN4ZBZGaU2lp0m
         v8doUxkiP+/dhp6j2O4OGGLQaImGeBleIqn6gy6pkQDMepGrdni/sAzZKDqEjtcvAr21
         6cZJNn9Q+C8ugHYVClTFyOPQmiinKq5JwIeQNRyhCX19i4CjfJj7QetX3TKuRYd1kq2S
         c9Mw==
X-Gm-Message-State: AOJu0YyjqojDT2I3hJHoLiaen0+SbWQAOsvFB4pxOoe3dSlOXfS6fApl
	7b0K0U+SQxUbRxakyvLh6QSH9YBAxZmckoabqENLuwZ4SJVvVG6j1AQ6
X-Gm-Gg: ASbGncsPW9x73kAgRVuH3WcCC68VTmM4gSFtbqjBLuangYpPScWwSEEHy1G3sMN+Ju4
	DO6/xg6TmWmo2vTRXehidTF9On/thuPuZaFzAEsqWE6Olx47+u5jeaatR0YfHI3tlDRMvrg4fof
	7eocE3gP6z1tH1INTcLI5/nAu1PxzvwJhTuqW91eUH+w0yC7Ocy9KToLYXx0CLJlkIgEVxw/kMA
	CJdnnUqy2jBMUhBcsi+NX5b0NFK4ETllVF5pBUEqa5N0+PCcZpzEjDV5LVnl2JXjAB+wV5JDRC1
	YUV2ANQO5F8F1dN2wWo5SbNyNlde8g7vuJReLDquwP/y8FxKqKUtbYMvTxjqP07S0MZ+VFXQdei
	rY4r37j6mnmf4Taa8XbrPVv+XCKq6mPWy9AnOQP+/tdibwxXuosPsi6Xa5I2luaFCU0eobQipAH
	+mEEtBnYK50KfyIKiw2iS3N3voQSBmJvMMFN3Qkt/3
X-Google-Smtp-Source: AGHT+IGISaQiNL2nljP+IMsXa56DSbAJrtX3Akp9ft4bJjSSyk9kRYZdB6UYHvnM4Se3HvX+ydFZUQ==
X-Received: by 2002:a05:6a00:4c8d:b0:76b:ea1e:78b9 with SMTP id d2e1a72fcca58-76c3727388emr20855456b3a.1.1754893373523;
        Sun, 10 Aug 2025 23:22:53 -0700 (PDT)
Received: from wen-HP-ProBook-445-14-inch-G9-Notebook-PC.. (36-239-105-221.dynamic-ip.hinet.net. [36.239.105.221])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bcce8f800sm25861623b3a.42.2025.08.10.23.22.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Aug 2025 23:22:53 -0700 (PDT)
From: Yao-Wen Chang <changyaowen19980629@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yao-Wen Chang <changyaowen19980629@gmail.com>
Subject: [PATCH 03/11] staging: rtl8723bs: Remove empty line
Date: Mon, 11 Aug 2025 14:21:26 +0800
Message-ID: <20250811062132.102525-3-changyaowen19980629@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250811062132.102525-1-changyaowen19980629@gmail.com>
References: <20250811062132.102525-1-changyaowen19980629@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit removes the empty lines.

Signed-off-by: Yao-Wen Chang <changyaowen19980629@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ap.c  | 2 --
 drivers/staging/rtl8723bs/core/rtw_cmd.c | 6 ------
 2 files changed, 8 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index 2e59a26e6318..fae557a0d143 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -438,7 +438,6 @@ void update_bmc_sta(struct adapter *padapter)
 		spin_lock_bh(&psta->lock);
 		psta->state = _FW_LINKED;
 		spin_unlock_bh(&psta->lock);
-
 	}
 }
 
@@ -1258,7 +1257,6 @@ void rtw_acl_remove_sta(struct adapter *padapter, u8 *addr)
 	}
 
 	spin_unlock_bh(&pacl_node_q->lock);
-
 }
 
 u8 rtw_ap_set_pairwise_key(struct adapter *padapter, struct sta_info *psta)
diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index cc2ba213d07e..c4ead692928b 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -1260,7 +1260,6 @@ u8 traffic_status_watchdog(struct adapter *padapter, u8 from_timer)
 	pmlmepriv->LinkDetectInfo.bHigherBusyTxTraffic = bHigherBusyTxTraffic;
 
 	return bEnterPS;
-
 }
 
 static void dynamic_chk_wk_hdl(struct adapter *padapter)
@@ -1480,9 +1479,7 @@ u8 rtw_dm_ra_mask_wk_cmd(struct adapter *padapter, u8 *psta)
 	res = rtw_enqueue_cmd(pcmdpriv, ph2c);
 
 exit:
-
 	return res;
-
 }
 
 u8 rtw_ps_cmd(struct adapter *padapter)
@@ -1552,9 +1549,7 @@ static void rtw_chk_hi_queue_hdl(struct adapter *padapter)
 		} else {/* re check again */
 			rtw_chk_hi_queue_cmd(padapter);
 		}
-
 	}
-
 }
 
 u8 rtw_chk_hi_queue_cmd(struct adapter *padapter)
@@ -1923,7 +1918,6 @@ void rtw_createbss_cmd_callback(struct adapter *padapter, struct cmd_obj *pcmd)
 	}
 
 createbss_cmd_fail:
-
 	spin_unlock_bh(&pmlmepriv->lock);
 exit:
 	rtw_free_cmd_obj(pcmd);
-- 
2.43.0

