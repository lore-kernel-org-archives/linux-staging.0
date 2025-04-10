Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F41D28A416;
	Thu, 10 Apr 2025 13:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744290427; cv=none; b=DcEEHaG6K/A0j4X5QiLCaD6TVBw6zpHzfBDlTumWi9CrsDNrZjA+aefz82xFnkuvrw3/jndMXHVecl87tSB0l63k3Oe9cfmNH+XVTq8WIDL7BCm8nXIba6qOncmvRFtl1YWm7ALoc2nid5aDjkfTQzz7sHKjXDTjW/ivvPfIxBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744290427; c=relaxed/simple;
	bh=gD/ivy8TozAfZl09YY5BEmq3r9BlB+mpS1btyHwFBW0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RpKzymdxfTvmvX77uSM5PurzYB51D3Q8v97loDni446svYsDf0TYtWyjgAY4xFvOk7s+8r5Q9ed5q+ZEeW6R5dGcrwPUcnxfltoA2hSrTm0MuqPOc1GcxnTvOtW+fybR1BxDkS7bx1cx4wWcklo+/+y5ejtUC+Wx/d+FVuxECE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=no5/4Ag8; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="no5/4Ag8"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43d0c18e84eso3876525e9.3;
        Thu, 10 Apr 2025 06:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744290424; x=1744895224; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xb4/K9i3KehiCtF/Usls0i0omViTubWO0lqe6s2Xk6Q=;
        b=no5/4Ag8a4XRilF08h+r4cu18BOamdiAnRA/jHCNL/aHX4RbIC3jViVzJlChYPwF5D
         PCtAF0Akc+3o8peKW6qAdrRT2RsfZBLYfQ6UNCmRtDkc6GU37BJiXE2F9XbgoLBqdWKx
         S98Xe34ejQ7YQS0vgCLb/k17tbxAV3fBgumO7mHP+r43cViBOQUi9bkdA8yCJiLy5GBh
         nICKlMflBdE93/bf/3hWzjiyl3lEcW0wXNGN/RdbN3eACtJkT+EVUZpX1rzgccfxOOgB
         SkX4LNemEPftxRL8JszDe+yg46STy4I/10k3mgy5r43TTkzIE++sKdn7BS/O0GpBsWq8
         FahA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744290424; x=1744895224;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xb4/K9i3KehiCtF/Usls0i0omViTubWO0lqe6s2Xk6Q=;
        b=kdQwC0c29f1pYk6dL08iSkPdFYLw+I4nn9aZFg40fCxPzUHcgFiVwi4on36j0aKjc8
         sOreN+RTMQ9dSFQPuRp1AFYRsn4I7+OKTOahrli2zo243JlSExPRFOtxHxay44sdQp+q
         DqvcXOtCKtDAg+ju+L8lRC6HSvSBiu8QWseSahsmA7KS22ay1h4+Dgpm0KrAkVTeORT2
         SxCOQVWZRqP7ZRlXo5GKKWVYU7IS9rN8Gryt+XZLOqKtV2xmMeQ3/UIMiLeUzTxo+kkP
         4LFIQxSjttrWNySs5yFvazzluO1Dz+LH0mLrgNTUwYY9JNjANSUtQXLg0m5P6Umpozv9
         NE/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUSpF6IwAx41E7FJUrNETkILYlOALZlKaxjn1RNUeLMxkkEoGnX1ORj2kj4EJxx6TrfRe7xjv4mNpsmajzT@lists.linux.dev, AJvYcCXxDbDzR+xATNNFmqTxe3g7akduXy7OWc6wgnWxgcrrLmEC4eZFjV4DB0DIyjtaCcF9cCzxgWE0zkFG@lists.linux.dev
X-Gm-Message-State: AOJu0YzgIlcCVxfCPTNB+Li2Q0FyLb9TFNNgeIdz+iAUu4OShoNF7F6O
	3ftNMjC5ze+qpB2xi4pZMY2IxOxUQVh5MAdDRVV6zkezF09CId6W
X-Gm-Gg: ASbGnctJrB3LNxt4qWAOHnjn496JdyZ38jXcsO1OlzNhhb8TGhzyGHjeRSQCIkEkvrs
	kGcJqV7XsIKYyY+mymXTfEkdJO0TyaRUCM5Mbc4nmDGh3ZimVyR/gqGbsBp367uGcIZFMLLaC76
	ZGcexSkIXJyeNYBpoYeT9DUtQ6DtK/hdvrddHXKHVyl70fqu+2zqRIwYSffm5lcHQE5v3UG5oiQ
	r3RgQal5vHSnqxwDwgixv87GiaTes3+gZ75/b5gzqwVVJeSc5oUnDxwGw2q+lLr2XnJhDXa75V+
	2erb+yjwLhA+SW4sU+sOyqxSVgyUAwHQ8EAAEg==
X-Google-Smtp-Source: AGHT+IHJXFAWfo5VZ1vG/fakJyccgk0mpHMtlCd905bv/mlWMdNr7tRkIyIJsjHbOLe4gopOeRo1JQ==
X-Received: by 2002:a5d:5f4f:0:b0:390:eebc:6f32 with SMTP id ffacd0b85a97d-39d8fda7660mr2252641f8f.48.1744290423424;
        Thu, 10 Apr 2025 06:07:03 -0700 (PDT)
Received: from pc.. ([197.155.71.138])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f2075fc6dsm55013045e9.28.2025.04.10.06.06.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 06:07:02 -0700 (PDT)
From: Erick Karanja <karanja99erick@gmail.com>
To: gregkh@linuxfoundation.org,
	outreachy@lists.linux.dev
Cc: karanja99erick@gmail.com,
	philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6/6] staging: rtl8723bs: Initialize variables at declaration in rtl8723bs_recv.c
Date: Thu, 10 Apr 2025 16:06:11 +0300
Message-ID: <6acc4efa84d38f5da7cb718d383664832bfb0370.1744285781.git.karanja99erick@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1744285781.git.karanja99erick@gmail.com>
References: <cover.1744285781.git.karanja99erick@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make the code more concise and readable by integrating the initialization
directly into the variable declaration in cases where the initialization
is simple and doesn't depend on other variables or complex expressions.

Signed-off-by: Erick Karanja <karanja99erick@gmail.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c
index 28c914ec2604..8d0d8e8e837e 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c
@@ -367,14 +367,11 @@ static void rtl8723bs_recv_tasklet(struct tasklet_struct *t)
  */
 s32 rtl8723bs_init_recv_priv(struct adapter *padapter)
 {
-	s32 res;
+	s32 res = _SUCCESS;
 	u32 i, n;
-	struct recv_priv *precvpriv;
+	struct recv_priv *precvpriv = &padapter->recvpriv;
 	struct recv_buf *precvbuf;
 
-	res = _SUCCESS;
-	precvpriv = &padapter->recvpriv;
-
 	/* 3 1. init recv buffer */
 	INIT_LIST_HEAD(&precvpriv->free_recv_buf_queue.queue);
 	spin_lock_init(&precvpriv->free_recv_buf_queue.lock);
@@ -453,11 +450,9 @@ s32 rtl8723bs_init_recv_priv(struct adapter *padapter)
 void rtl8723bs_free_recv_priv(struct adapter *padapter)
 {
 	u32 i;
-	struct recv_priv *precvpriv;
+	struct recv_priv *precvpriv = &padapter->recvpriv;
 	struct recv_buf *precvbuf;
 
-	precvpriv = &padapter->recvpriv;
-
 	/* 3 1. kill tasklet */
 	tasklet_kill(&precvpriv->recv_tasklet);
 
-- 
2.43.0

