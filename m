Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 352713FC9
	for <linux-staging@lists.linux.dev>; Wed, 22 Sep 2021 20:05:39 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id g16so10443681wrb.3
        for <linux-staging@lists.linux.dev>; Wed, 22 Sep 2021 13:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Zdg0ApDj4T40ceOwnYh8jnghOBBg9kMORnILNtCiL9U=;
        b=Rla5l0Yxy4lbAhh6y+O1KYmWzVSaCfdlrdJ/OWwwupp31cjx+/EjnFbGmTEvmjq1i9
         R87GJ3hLHH8g9kQZztyikIksGfMHACWQNRpg3Dr/rP5ytEyqTZFOmJiirvB10Wm1hA87
         TRolSYs4eW+h2Lk6bQrGT9bBGMgqTKmg1Z0OEXggHNMzX9JBk0ypLqVScuRGjbqD/ORP
         dGVFGbI81OGPxbj1D0WjkRZDlWVThV98Ln83kdjnrOP/WtVbamPG5PnNJDT7uaUe1Gma
         oUlF6k4aJeFr4ti6CWIBTlA92eMe69u78n4yIWJ9jvK+7LjZLzBNvIQgtwNCii3VdgnZ
         7k4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Zdg0ApDj4T40ceOwnYh8jnghOBBg9kMORnILNtCiL9U=;
        b=esEufdQqADif3V1q+L7HaIFJZATPCuL4zYSqgWGC9kOyehiGbteBE2LhcUqmePGckC
         2UQOSvxxh0MSJZu7TH+ELdKpMNRTpQYwygRBKnsMfjg18LyXMaEmyiuw/fdGKR7JdEJU
         +C1flvwvS+aHs6NUE0dpxKTyy4bVmK/KuVGzF3mzOP8dhhrI7GMD9k3UxJ9RoQYL2oH/
         4kpV0NFcn1bhn/CIXknz2JIOsYLNqzDiot942CchWxheO/UWlFIYGk/YLuQ9ship2HK7
         qMebYxHqSeARiTzmw3hZL/VOZqPrwxCLUEMQhpNK/PaIGvVMmHR9kLjBELyPY+KuhIBz
         kxkA==
X-Gm-Message-State: AOAM531akLtp4dBTT/C9w3Q9BF4Y1AmIcRpvBgQ2gvcv/tSu82akwKX0
	pyE0U16DgGdcquG3j3BySRc=
X-Google-Smtp-Source: ABdhPJzuDBrdXSgertbvORZzAVOIt3mC6Rd0p132EE4uLSvZWDC5IeDVvPCCESdOgxjfKSZvbTflAA==
X-Received: by 2002:a05:6000:1a52:: with SMTP id t18mr871746wry.21.1632341137711;
        Wed, 22 Sep 2021 13:05:37 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::cde])
        by smtp.gmail.com with ESMTPSA id e2sm3219761wra.40.2021.09.22.13.05.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 13:05:37 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 14/47] staging: r8188eu: remove issue_probereq_p2p_ex()
Date: Wed, 22 Sep 2021 22:03:47 +0200
Message-Id: <20210922200420.9693-15-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210922200420.9693-1-straube.linux@gmail.com>
References: <20210922200420.9693-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Function issue_probereq_p2p_ex() is not used, remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_mlme_ext.c   | 37 -------------------
 .../staging/r8188eu/include/rtw_mlme_ext.h    |  2 -
 2 files changed, 39 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index c35ca002b63f..905e7f0b83d1 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -3690,43 +3690,6 @@ inline void issue_probereq_p2p(struct adapter *adapter, u8 *da)
 	_issue_probereq_p2p(adapter, da, false);
 }
 
-int issue_probereq_p2p_ex(struct adapter *adapter, u8 *da, int try_cnt, int wait_ms)
-{
-	int ret;
-	int i = 0;
-	u32 start = jiffies;
-
-	do {
-		ret = _issue_probereq_p2p(adapter, da, wait_ms > 0);
-
-		i++;
-
-		if (adapter->bDriverStopped || adapter->bSurpriseRemoved)
-			break;
-
-		if (i < try_cnt && wait_ms > 0 && ret == _FAIL)
-			msleep(wait_ms);
-	} while ((i < try_cnt) && ((ret == _FAIL) || (wait_ms == 0)));
-
-	if (ret != _FAIL) {
-		ret = _SUCCESS;
-		goto exit;
-	}
-
-	if (try_cnt && wait_ms) {
-		if (da)
-			DBG_88E(FUNC_ADPT_FMT" to %pM, ch:%u%s, %d/%d in %u ms\n",
-				FUNC_ADPT_ARG(adapter), da, rtw_get_oper_ch(adapter),
-				ret == _SUCCESS ? ", acked" : "", i, try_cnt, rtw_get_passing_time_ms(start));
-		else
-			DBG_88E(FUNC_ADPT_FMT", ch:%u%s, %d/%d in %u ms\n",
-				FUNC_ADPT_ARG(adapter), rtw_get_oper_ch(adapter),
-				ret == _SUCCESS ? ", acked" : "", i, try_cnt, rtw_get_passing_time_ms(start));
-	}
-exit:
-	return ret;
-}
-
 static s32 rtw_action_public_decache(struct recv_frame *recv_frame, s32 token)
 {
 	struct adapter *adapter = recv_frame->adapter;
diff --git a/drivers/staging/r8188eu/include/rtw_mlme_ext.h b/drivers/staging/r8188eu/include/rtw_mlme_ext.h
index 89020f828e08..5b307ad3afa5 100644
--- a/drivers/staging/r8188eu/include/rtw_mlme_ext.h
+++ b/drivers/staging/r8188eu/include/rtw_mlme_ext.h
@@ -541,8 +541,6 @@ void issue_p2p_provision_request(struct adapter *padapter, u8 *pssid,
 				 u8 ussidlen, u8 *pdev_raddr);
 void issue_p2p_GO_request(struct adapter *padapter, u8 *raddr);
 void issue_probereq_p2p(struct adapter *padapter, u8 *da);
-int issue_probereq_p2p_ex(struct adapter *adapter, u8 *da, int try_cnt,
-			  int wait_ms);
 void issue_p2p_invitation_response(struct adapter *padapter, u8 *raddr,
 				   u8 dialogToken, u8 success);
 void issue_p2p_invitation_request(struct adapter *padapter, u8* raddr);
-- 
2.33.0

