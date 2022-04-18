Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3460BA29;
	Mon, 18 Apr 2022 17:23:46 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id 12so12849303pll.12;
        Mon, 18 Apr 2022 10:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=w84A5bSnfH8JPWuHmpfwhtHQL8kzzjVsgikmw3NAGNg=;
        b=fRhwSkr30I2GH+odEqNIwtcw6Mkc0hs533hCNGNu6B733isTMyN7mgdaKJgnWGDzEl
         uhuORa20O7wxLI2fE+KLlFcOaSk6ihk0xdw+Se0E4RwpcwCBNNsm470hU/synopNyK6a
         pws6E8OuSufQCw6xr+gShLZC0yxbf6DEZRQGxhBlFl/uT9ybPy4/2v200xJVgdS9V3aZ
         7JF4lfZ2lbZm6vMLIZBGdhDP7mUpgcMb0QdGJgRz7QVUotehsgBRObxX9Wusw548AHgq
         q373jx7YHbzuvYTNCUJC6fW8z7kiHgN04Y6B1/+jto9xSuqRl/jrBAc/XVwzbTAd04Sn
         0pgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=w84A5bSnfH8JPWuHmpfwhtHQL8kzzjVsgikmw3NAGNg=;
        b=04h1l/1lKBGH0fwKnxUemlVtHodkdhnwPPa40VBj40w9XTpD84uLVgmtw5vQjT+I8h
         hnDfkC5vq7tG70is3WWckaGK5dJSdJzqEpt9Pp4l+yWygOZV7O3CRuzkn7BLs+Rh7bAK
         M6RlmSyJIG/P7K+5YCBrpHvEKP6bW8y7csWOv1LidhZyBK8Jpq7IPy5e1Lz8UulHr2rk
         bwX8QbdmI7foSmezFXuEmDiXdxMcz5YuItXRnkUF0mlKo16ZMqBRUagR8a1vKGq0f7jr
         LuB+IevPdNPALcsxpw/PSAmykg6T5ZFmp1oi+1U/vECWa+FXh3vXKkPm+FLUyc9MGDql
         uqow==
X-Gm-Message-State: AOAM532GxpCDXd14Jt6r8lP5EtzXZraHbZ1UqulPw3J0jZZ0Q/6DCJ5Y
	1aTXnT95iAkvF9SguALYzQA=
X-Google-Smtp-Source: ABdhPJzAQUrr9wPWIp/IDtWYEjrW8r1+3GdG/Kl5eQZZhBJXkcJeST2nsFkYH/qrtsTT3vQplbAPOA==
X-Received: by 2002:a17:90b:201:b0:1cb:a159:65ce with SMTP id fy1-20020a17090b020100b001cba15965cemr19878149pjb.104.1650302625656;
        Mon, 18 Apr 2022 10:23:45 -0700 (PDT)
Received: from aliyar-HP-Laptop-15-da1xxx.domain.name ([14.139.241.88])
        by smtp.gmail.com with ESMTPSA id y9-20020aa78f29000000b005098201d2f5sm13041394pfr.205.2022.04.18.10.23.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Apr 2022 10:23:45 -0700 (PDT)
From: Aliya Rahmani <aliyarahmani786@gmail.com>
To: clabbe@baylibre.com
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	outreachy@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Aliya Rahmani <aliyarahmani786@gmail.com>
Subject: [PATCH v3 2/3] staging: media: zoran: else is not generally useful after a break or return
Date: Mon, 18 Apr 2022 22:44:54 +0530
Message-Id: <20220418171453.16971-3-aliyarahmani786@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220418171453.16971-1-aliyarahmani786@gmail.com>
References: <20220418171453.16971-1-aliyarahmani786@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the else without affecting the logic. 
Fixes the following checkpatch warning:
 else is not generally useful after a break or return

Signed-off-by: Aliya Rahmani <aliyarahmani786@gmail.com>
---
changes since v2: Rework commit description and subject
---

 drivers/staging/media/zoran/videocodec.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/media/zoran/videocodec.c b/drivers/staging/media/zoran/videocodec.c
index 16a1f23a7f19..19732a47c8bd 100644
--- a/drivers/staging/media/zoran/videocodec.c
+++ b/drivers/staging/media/zoran/videocodec.c
@@ -98,9 +98,8 @@ struct videocodec *videocodec_attach(struct videocodec_master *master)
 
 				h->attached += 1;
 				return codec;
-			} else {
-				kfree(codec);
 			}
+			kfree(codec);
 		}
 		h = h->next;
 	}
-- 
2.25.1

