Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 427076130;
	Fri, 21 Oct 2022 19:56:28 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id s196so3460717pgs.3;
        Fri, 21 Oct 2022 12:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wbRVFQiQ0KizwuJ0kgho517m1and4hrijf2KVLnECg4=;
        b=gy2xJoXvDq0x7SptUxENjlKj97jrolncTGtLTh7V/00DYvmiuytlbGwQxCUKSV4v2E
         PuxoEjvH0HH6RM1PgDxcFooeYDBgP5wMmYPSpM77Hop593hR/I7DHcomUa7Z/zlmI1ZQ
         pQWVIhP3I0RPHFaKsrXxQANRHAKqgIwBJ7VXa2KEfgHGIYNOe+vbrOg0keOhPzMz49hz
         vPjValM2YGnqZQk+AbQ0oCuX630kiAsGvShblGu25U1kD/ob0yt997iWmNkbSytHynVG
         kdWZRa0j1BAxowxR1uUb//bZa/bYijYDKjOwdZ40fVbv3x8e0KPopKAGHiP8wSb5FsJm
         onGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wbRVFQiQ0KizwuJ0kgho517m1and4hrijf2KVLnECg4=;
        b=RETHxlTTMgpN01RatLxEcFaXDOSIq/cw76EpDVosYMxMeXfWJUPTgVycJLMNvDX+y+
         2qhUuMuaMlXA1wRMXjCqxf2E0Txq3GxdmDKNEYaqPyaLLXHhQtH6LKgCeTK7nBVSxaFB
         D4795V7/6yQ/mjScdurJQz3gZzqKB+O2Hs4z4D99WWfbUkIc9ej+dxLXetPTIgvtAyrX
         1IDE+3D9AC/rfPYWi9ku6fowTBBU8+aZmsrRUEyXBeIBTh7F4N6jBJSEqA7gdPakDLyy
         9YPcJHwFs3wIPTtTeE9R/eFt2755CmCiAG3ZAW49w/JcNIyMqnUuMWpUbZ0DSKKt8ja4
         lbzg==
X-Gm-Message-State: ACrzQf3SZgLGX+OfxAAsqOonm8y5XV0TFDkNy1JiLBLO4h6F7cDRlsL7
	MR61sYrq/k+d75INzzqlkOEKL2Q22lZkrA==
X-Google-Smtp-Source: AMsMyM4AUWIv6wLc4JZEAhklPZ9RVIHG4XLhUfzCZRNvlhuc5n8hl/ECfbreu7MvQS7yL+IELXoz0g==
X-Received: by 2002:a05:6a00:1a47:b0:52e:6a8c:5430 with SMTP id h7-20020a056a001a4700b0052e6a8c5430mr20392527pfv.48.1666382187830;
        Fri, 21 Oct 2022 12:56:27 -0700 (PDT)
Received: from localhost.localdomain (192-184-163-51.fiber.dynamic.sonic.net. [192.184.163.51])
        by smtp.gmail.com with ESMTPSA id g13-20020aa79dcd000000b005668b26ade0sm15179345pfq.136.2022.10.21.12.56.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Oct 2022 12:56:27 -0700 (PDT)
From: Emily Peri <eperi1024@gmail.com>
To: gregkh@linuxfoundation.org,
	outreachy@lists.linux.dev,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Emily Peri <eperi1024@gmail.com>
Subject: [PATCH v2 2/3] staging: rtl8723bs: add newline after variable declaration
Date: Fri, 21 Oct 2022 12:54:56 -0700
Message-Id: <76e1bfd210d79e6d3f7cc09233621c8b741b2370.1666380274.git.eperi1024@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1666380274.git.eperi1024@gmail.com>
References: <cover.1666380274.git.eperi1024@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix checkpatch style warning by adding newline after variable
declaration in rtw_ioctl_set

Signed-off-by: Emily Peri <eperi1024@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ioctl_set.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
index ede7d2930844..47323160e72d 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
@@ -78,6 +78,7 @@ u8 rtw_do_join(struct adapter *padapter)
 		goto exit;
 	} else {
 		int select_ret;
+
 		spin_unlock_bh(&(pmlmepriv->scanned_queue.lock));
 		select_ret = rtw_select_and_join_from_scanned_queue(pmlmepriv);
 		if (select_ret == _SUCCESS) {
-- 
2.34.1

