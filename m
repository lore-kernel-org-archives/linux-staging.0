Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71B6123238B
	for <linux-staging@lists.linux.dev>; Tue, 10 Dec 2024 21:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733864910; cv=none; b=XJyEE+6Ybgw07/uBXAhD8AxE0dsHNTtHuUJnkhcJA8Uxh1PGA5jmqxTF/bT4XxAmIOuUft3SsrCzCLhTfcou7cPrEFHwFN680ZPOyXODBojxGnaK95947lwLyqtxfXBIxfSGjAt+aYs58aYBWUsVazlwdZJ42QfxGmesAY7Fh0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733864910; c=relaxed/simple;
	bh=CDXIfy3YQvMoIcBioQwy2dUQZMASYSjIFSFtueGVukU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F9n36A0+byUC1l30dAp3EB4xmP2oVFNAFTwa+zSqhUm/7cjqt9vZ1lG/Y5Sc1YTZaDG6OHj7SU5ejYam8n3kr+JP/w/b2bEvS2B1fTw4khJnRs1sNkC28RMext5ZJaJfojVZgKmEfZxGGHbT4WhFO1Fiyk/kTNCOat7PhgddeMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QUFa+jIS; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QUFa+jIS"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2ef87d24c2dso2806403a91.1
        for <linux-staging@lists.linux.dev>; Tue, 10 Dec 2024 13:08:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733864908; x=1734469708; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cmM5ilpxdp/4WJ1oVXkjuvQCAWPFFBfzL+5a70ISH3A=;
        b=QUFa+jIS9o/GPTAczOaeqtNLOZnSyWxK/iXPVcD1eowOm3dDzt+q8R36KbD1eEwdiL
         fMwZIdWcJKXDkYjgnpPknIRQqqimPzgsuLrJAIW8FcW5qc3TUbw92FymlhKFX/GptSoD
         CcnIrL89NgJTU+lf/Bm8gglH2uwC26HfGJFr1NtlVlD2yYPr5pkybEqSri/0zZnQdtS9
         gpIykrWE356mRm02p73UbophCzdlKi64sqHURnromYLorcQLqSkO/LHxITeEIW+Da4ZS
         +9mB+B0IOEZDX0N7nKwYijGatDlcSEboLLZbDeW+4XYXiTfiBPAqfLVBBNFg6yzmOs9d
         bYvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733864908; x=1734469708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cmM5ilpxdp/4WJ1oVXkjuvQCAWPFFBfzL+5a70ISH3A=;
        b=d8r0OoVCVKfUNxbtPrU75feHWU4rdzolopwDKiQKu03jCRT/KyLXZgG1KYYezXeJdh
         HZi4AJXQkFGrj2rc1+W+8LMjBo9TDTanF44702AqSU95HiRQs4U4z91mXoIWil3X6wPk
         2GotVxaxhG+jbMFecEVY/6qXwDxrYtEo/dLjeEGmppmv9OppqwSu+OvRSQwU91ZEQ4Zf
         yerkyfeL0LWHpkQbayiUUN18gkrb0DgvLAbFcdvk+kDDLaB3CVOvvdjB8kbqmJZHLLjI
         1HmWPzenAn4hDyT0SQisry07M7Zo5PsVkf45zicckBs54UCcYnOUstNaNJmwc+5n5f4f
         rE7A==
X-Forwarded-Encrypted: i=1; AJvYcCXuF/xAtgyXIeOnyM6NiHJRxpZ57/SgZFcl1Pl0ezoKho06dRt0Mu9wJ4EboLzjz5qlxyNwLl576yx0rph7@lists.linux.dev
X-Gm-Message-State: AOJu0YxNEtX7WnrXxZu2BJBwC6bryuYJ0nUm75U73ebu5GIpEbkw9NOJ
	CPvSN6ijm0ugEJJb1CxFFBDMTzOTVE6NR5ajgunW33pUkGVbsdLL
X-Gm-Gg: ASbGncu9Pxd0j7WECmA0drT1wvgAtrLWmeUPJhhPcpN1wlp5E4VJU9zj7rRl3RlvbSG
	3YyWZklPY/BaBxT7I9vNqQ7pazRl6Nr4hTbQ9BDdhyC/41Q+gzuPcdEw5qg5ICh3iqE9sBknXi6
	HWx4rkh8OXlho0cRJJZu7XpJe6uGnQFtPg54xIta5pw/n8X45Da1JKJuizSPUQvmA1X+/9I++Aa
	NkLSwmI3qbkKbTQYwj7a5NBzu3/ezO6/ObWKQuYOvQzR+Y8epiOnr59l4nlk2G6SU5UVOP5vt/E
	NA==
X-Google-Smtp-Source: AGHT+IG3jeXkz7uIamB7vFNp+gUbCT+d8SNySxHxTgaFtqZZSw2v1DEnnuvbqQj7GfGUZ0uwHg4eTg==
X-Received: by 2002:a17:90b:1650:b0:2ee:a4f2:b311 with SMTP id 98e67ed59e1d1-2f127f55cacmr693734a91.8.1733864907550;
        Tue, 10 Dec 2024 13:08:27 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:4c64:81ec:7409:107a:a63b:a3da])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ef2700979fsm13385731a91.18.2024.12.10.13.08.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 13:08:27 -0800 (PST)
From: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com
Cc: ~lkcamp/patches@lists.sr.ht,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/3] staging: rtl8723bs: remove HAL_DEF_DBG_RX_INFO_DUMP caller
Date: Tue, 10 Dec 2024 17:48:20 -0300
Message-ID: <20241210210741.17101-4-rodrigo.gobbi.7@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241210210741.17101-1-rodrigo.gobbi.7@gmail.com>
References: <20241210210741.17101-1-rodrigo.gobbi.7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the HAL_DEF_DBG_RX_INFO_DUMP enum caller due
to the removal of DBG_RX_SIGNAL_DISPLAY_RAW_DATA ifdef.

Signed-off-by: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 317f3db19397..952ce6dd5af9 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -4959,7 +4959,6 @@ void _linked_info_dump(struct adapter *padapter)
 					rtw_hal_get_def_var(padapter, HW_DEF_RA_INFO_DUMP, &i);
 			}
 		}
-		rtw_hal_set_def_var(padapter, HAL_DEF_DBG_RX_INFO_DUMP, NULL);
 	}
 }
 
-- 
2.47.0

