Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D10FF71
	for <linux-staging@lists.linux.dev>; Thu,  1 Apr 2021 09:21:27 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id l18so1141228edc.9
        for <linux-staging@lists.linux.dev>; Thu, 01 Apr 2021 02:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FiriAVBN/K4zFoUiIgg5H+KCI+lUplIfvn+b2uqWN5o=;
        b=cW45/t5M+7irjQG6v19jtTLjNvVYjoAn3oUD4lUCeqXWTspxSYLnvVUSbkQYB35orr
         kU1RC6jCvQGh9a84/9T5A3kknJk+zxMxviWes0I5LZe2k3iOUhVJGgh+mFrIr7ZmGbo7
         5V6p1l7F703Qz5hff5v9mMGrVnNFgZGR4ZuSd23Mx9MUe/TJmideeLJ6pEfSNO+WzeM4
         D64CmQDMIHTIkhhPcyY+iODvx3CtPjbRFh+2EntDbzmrqeYQw7l87F6qbMzraxXSbg1r
         Gds2hIum7xdjUsuIZzwG8YUTM48n5vGls9XF+kjf/cYnSLC7rkOVG5xjQn7AE5RInzsO
         2m/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FiriAVBN/K4zFoUiIgg5H+KCI+lUplIfvn+b2uqWN5o=;
        b=CMmRQsNe95uzH50KCsHpO2xYaXjrsLB8UGrpaKwoVFmZI4Sh0+g3DZqA3omzPt5JhQ
         KtOh0ml5QP5YpkSyy+WW6Dq6MHmUYIIMuPQoMbnAIgt/37+RY3NKMR/a2oxdc26E+z17
         kZAx2fTQ9dbn4yw9WuscJpvUE7/Rr5NWeHPPb+s4RrhhTZt+gqWaNdokytrII+Ozs4aL
         uYML/ljDnXG6z2YFTTue8miFyzIR7GuJCJiOT+7O/7jSy5yf58QF1P4R/3U2m4+KZ4eq
         HWuX2v4YDl3/C3mDtB7jrdjOjigSZzmfnfFmq4memLb4kpq8+cWQJ9wbODbhNW+co+Y2
         r24w==
X-Gm-Message-State: AOAM531bgnLhVMuNNgN1dLk/d+1d/FiwzDuuJf+hm3jvZDXtZ3Nnqxkl
	rC9wzt3MqU7IOKzAchANfni/Z8MNLKl3fw==
X-Google-Smtp-Source: ABdhPJxklvXLyC8rnfpt+YIduNy3C2DYAvjupKcbzaAMRPOJM+7dxwcUAFY7tyJtBklc6nImjxTWHg==
X-Received: by 2002:a05:6402:b31:: with SMTP id bo17mr8683612edb.113.1617268886411;
        Thu, 01 Apr 2021 02:21:26 -0700 (PDT)
Received: from agape ([5.171.80.247])
        by smtp.gmail.com with ESMTPSA id 90sm3726324edr.69.2021.04.01.02.21.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 02:21:26 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: joe@perches.com,
	dan.carpenter@oracle.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH 02/49] staging: rtl8723bs: remove empty else blocks
Date: Thu,  1 Apr 2021 11:20:32 +0200
Message-Id: <f966fcc0621ce79fff5bd3b49d699ade7cf34c13.1617268327.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617268327.git.fabioaiuto83@gmail.com>
References: <cover.1617268327.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove empty else blocks

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_xmit.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 05aec2ee5a0b..d8e4e7cff377 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -867,7 +867,6 @@ static s32 xmitframe_swencrypt(struct adapter *padapter, struct xmit_frame *pxmi
 		default:
 				break;
 		}
-	} else {
 	}
 
 	return _SUCCESS;
@@ -1140,7 +1139,6 @@ s32 rtw_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, struct
 			ClearMFrag(mem_start);
 
 			break;
-		} else {
 		}
 
 		addr = (SIZE_PTR)(pframe);
@@ -1783,7 +1781,6 @@ s32 rtw_free_xmitframe(struct xmit_priv *pxmitpriv, struct xmit_frame *pxmitfram
 		pxmitpriv->free_xmitframe_cnt++;
 	} else if (pxmitframe->ext_tag == 1) {
 		pxmitpriv->free_xframe_ext_cnt++;
-	} else {
 	}
 
 	spin_unlock_bh(&queue->lock);
-- 
2.20.1

