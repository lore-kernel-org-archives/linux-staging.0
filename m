Received: from mail-pj2-f11.google.com (mail-pj2-f11.google.com [74.125.227.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 146B32836A0
	for <linux-staging@lists.linux.dev>; Mon, 13 Jul 2026 07:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783926357; cv=none; b=CAIN2G3iBo6a4Qtxedt5UsnqCaJ0bjMzPFQA6T8O67nDCzM2JMJuHfng7A5Bm8aLxKtKGg8ktmacRT1i0Wd7r2abrfUAnB2vzygarMPZwWHOmIqkrL1AoveG7qLBlxhbvIbzXrIGD/FieSJpJz2m7Ybtd7hOSfraTlJcCaVJdig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783926357; c=relaxed/simple;
	bh=f/MBbiCuKKupEkf1byRULDmHXfS8NTVvAP9nhNm0auc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=smMRJHZFiWKurEy/v6YGcBKLkwJ6DT+MXHNJHHoSwWITVzFeU0E+esyRNbRh6r6pqpObCHWNmIBhfJz1q1OjRdTx1Cmb9x7qMxCowQ0cXtViTYEumMkAHogQE2NOqcMRWfW3JYANcXsqfWMpyG43A5uvWkTKk9G6BqFgeEqKSsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Aui72R8S; arc=none smtp.client-ip=74.125.227.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Aui72R8S"
Received: by mail-pj2-f11.google.com with SMTP id 98e67ed59e1d1-38de693676dso729565a91.0
        for <linux-staging@lists.linux.dev>; Mon, 13 Jul 2026 00:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783926355; x=1784531155; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qA1SnyVW2zGbBB6hZifBtURCT9h+B8LPBVvb0SNXHhc=;
        b=Aui72R8S5H0zRUkcHO7LHt6V/SQVhYG8V7TLiYihOX3WhMO85cMJCQ8pMqIgn3xMu/
         11G8Op1FIHDZWIkxeq0SUoLAwdKymdRx/Reeu9suz89/KtImK4Srhy9N+4SUR/gNq2HV
         H96+zoze6HyuSLNNsJGwzaOzXvL/orMG3OV72f/hMC4bdYo/aXgXKc7WhhS5HL2f1ieK
         rCAQ/hvIYEzCA3PBXS2uR/bJv1XKb0lbsI2zaYovGrgFXInBO0ozUFVadhA45UBzrH3F
         xO/tGeN0MMUDemSg5fepZJ8d0piRO3R+6yz9sarPyNOuDFk+z7wruDqOz+xUYg8z/czQ
         hv9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783926355; x=1784531155;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qA1SnyVW2zGbBB6hZifBtURCT9h+B8LPBVvb0SNXHhc=;
        b=E4bi6LQLlk4R9rgxmcKxTjuEpqa9JjKdlZjzyoB5UvhfLgk+/zUEGOAZCqqe7vlBHz
         X47/2j9An9XzMnL24KfJ6nevQmac9pcBuPgeryJQOKS/d+tLUqsMW9Nisrg5lgrQfZfV
         51MDyUTr0rXN9Z1VcQBwptpbmrSP/TMY1u84ZrEIf9ojrqr5tz/H7eUH+AoUg3LSbcvy
         zPSPZ8baMPWCNyRHQtFF3Qw7wC7JekcOf8iV0JkLxlwalAWjYk5q3kq3O3d3614RtQ4F
         7M2KGmYYaBZWRfOLfjjkpNJFNLOWAogFfrmplCE0+7R8LcmO4CrL7bNNJYRxxzoPE6eX
         JNAw==
X-Forwarded-Encrypted: i=1; AHgh+RpmTs7oPsjk84i9A/qYaBdfjxDVWPu44XgMf2p5OhUhUP4X3hHBLzxM5R9UbVmImDg6NgLoXKNEl9529Rr8@lists.linux.dev
X-Gm-Message-State: AOJu0YxIbUfZN8ibhTmXxTBDh+ijIZ8iwUHgC0xnbtl/tAA1znYC9Jx/
	B+FKeSzSMlviAdjBeWhDR74yZSicq76cTXpD6Y4WuacylCDGNWn0vuRK
X-Gm-Gg: AfdE7cmpupImuedeBkjsZRHssoz9tfCK20ShI4382+iPQlJfEmBLPTIglcsrftvniyb
	+dEur6tnzV7GzlLwfx0TRd190JcwIAOFYDY37ZDiL+y4Ilas9wwp/pYEwETiz1tPjqeVFGTtQHx
	VavIty3UnmTjemgVgdLPgnaD/fR+7NpuHZ6KDECIEULhB/1aFlf8TbcegAOUzBD6cIbqf0mDbJg
	D0XK/g0A82C1cft699rTWE326PLy1YDKgSzbf5qLPnm2moQ+VdzccTb5yjuj6hG8TO84ba+33CC
	Xyxz6W3Skff7sM5XIYSp4XywqNGpi6O/g8Dv1/HJVmyxlwbFa3ge1dPbem98IxE/bVxkIbtYW3o
	0Ip61iJLC8At3GWTVLCRf7JDms+YIr/hHWY7TxC1/WYqZiKYryJ7VDayGybRFCYccN9XGBz131u
	3/1jbYRYcd4D1GSdGcQXAGfTrs6pPUnPd2iNRSDsndoHcC
X-Received: by 2002:a05:6a21:4d8f:b0:3bf:97e8:a04d with SMTP id adf61e73a8af0-3c110b45600mr9044683637.43.1783926355337;
        Mon, 13 Jul 2026 00:05:55 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313b0240570sm33971943eec.28.2026.07.13.00.05.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 00:05:54 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: gregkh@linuxfoundation.org
Cc: error27@gmail.com,
	khomenkov@mailbox.org,
	khushalchitturi@gmail.com,
	s9430939@naver.com,
	nikolayof23@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH 1/5] staging: rtl8723bs: remove redundant return variable in rtw_make_wlanhdr()
Date: Mon, 13 Jul 2026 07:05:33 +0000
Message-ID: <20260713070537.15903-2-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260713070537.15903-1-dennylin0707@gmail.com>
References: <20260713070537.15903-1-dennylin0707@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The temporary return variable is no longer needed because the only
error path returns directly. Remove the redundant variable and exit
label, and return _SUCCESS directly on the success path.

No functional change intended.

Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_xmit.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index ca8f01575b55..ff67e2576b31 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -911,7 +911,6 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattr
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct qos_priv *pqospriv = &pmlmepriv->qospriv;
 	u8 qos_option = false;
-	signed int res = _SUCCESS;
 	__le16 *fctrl = &pwlanhdr->frame_control;
 
 	memset(hdr, 0, WLANHDR_OFFSET);
@@ -951,8 +950,7 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattr
 			if (pattrib->qos_en)
 				qos_option = true;
 		} else {
-			res = _FAIL;
-			goto exit;
+			return _FAIL;
 		}
 
 		if (pattrib->mdata)
@@ -1026,8 +1024,7 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattr
 	} else {
 	}
 
-exit:
-	return res;
+	return _SUCCESS;
 }
 
 s32 rtw_txframes_pending(struct adapter *padapter)
-- 
2.43.0

