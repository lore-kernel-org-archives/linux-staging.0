Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A2A16D0E
	for <linux-staging@lists.linux.dev>; Wed,  7 Apr 2021 06:46:04 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id q10so12287003pgj.2
        for <linux-staging@lists.linux.dev>; Tue, 06 Apr 2021 23:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Bzo2CT+YJY2F1z9OlT8tzpIHNon2mF4OUcXaigWQziI=;
        b=OEtvKnq84mcXwBBifO9jX76kOSHpziONcL5SKzP8vMLgmp7JMbP18Sms565rdCRbAg
         F74VNu3LB4OKj92SaXLahFRQPMsdBnVKp+pnWI56WwTHALeqkjyxqlHGOLDBvCVt6Ea4
         fPLdcaGvQHhrKQYPMu51quOb/Dka/kK7PksE5lPe2GQJbSLXgmKjQenbhCXDwvNH222W
         owOpH6N9/wPlMh6fp0isjuJx421rgai089408WskSCSJ9fs38RyhQSatoRVoB6/BadRU
         ZRY24NKce1Nb5TaeeCLY9dmCuvNIZE0h38G6ElF25/kOldIoCSx8i320p0Q8RqgGKmH7
         GC9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Bzo2CT+YJY2F1z9OlT8tzpIHNon2mF4OUcXaigWQziI=;
        b=j00qVrQxcMcZpKHzanwQa6VoqFBCKeqU3DJwNEgIw8ThdLyYXumbZxTN49VzWrsYkB
         ShwxDXFBAzRBAL/YXpKwO2HsnTI7bmDwidmt7Ql+2MtohXf+HJNn+hiupko9q/nQmk4t
         R2X51oCfPqhkJ4zTsOUkC8TnjBG30gdWDQg8yIvtCbY1MiXzOwtgZC5UMlLd+kSaM0wx
         YR8pOC1LSPpBVYTawNlp3ftznkScYy7dWi2+uhtyu4YtBdqU4Rs0z98/VtU0rI22bWpm
         2IdDO8UqhlfpMRD94CbLKm8UwZN2kFa+mFiqVz4/mNPVMt1hnLUihatRBh0+d1kKE48F
         Xmjw==
X-Gm-Message-State: AOAM5332YqaFBMkUxNAayOudv9CmBpHiYaeyRwWLL7tZfvdEzkmKtqiA
	QKf5dWPWzIRKI7ckU0M2nYE=
X-Google-Smtp-Source: ABdhPJz16x0AB9cEwqIJ3PiCLPa295Lf4wEyzta3KqGXJS2K67APQvuWlM4EKvxaAD65pfkEihHHOw==
X-Received: by 2002:a63:544e:: with SMTP id e14mr1978911pgm.288.1617777963878;
        Tue, 06 Apr 2021 23:46:03 -0700 (PDT)
Received: from localhost.localdomain ([134.173.248.5])
        by smtp.gmail.com with ESMTPSA id g10sm19697726pfh.212.2021.04.06.23.46.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 23:46:03 -0700 (PDT)
Date: Tue, 6 Apr 2021 23:46:01 -0700
From: Pavle Rohalj <pavle.rohalj@gmail.com>
To: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 40/49] staging: sm750fb: Rename function
 sm750_hw_cursor_setData2 to snake case
Message-ID: <89daa11a59211c35ddef3a88bf2937a0a3d6946e.1617776878.git.pavle.rohalj@gmail.com>
References: <cover.1617776878.git.pavle.rohalj@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1617776878.git.pavle.rohalj@gmail.com>

Fix "Avoid CamelCase" checkpatch.pl checks for the function
sm750_hw_cursor_setData2.

Signed-off-by: Pavle Rohalj <pavle.rohalj@gmail.com>
---
 drivers/staging/sm750fb/sm750_cursor.c | 2 +-
 drivers/staging/sm750fb/sm750_cursor.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750_cursor.c b/drivers/staging/sm750fb/sm750_cursor.c
index 98d294ac223c..3ee3bf78f7a5 100644
--- a/drivers/staging/sm750fb/sm750_cursor.c
+++ b/drivers/staging/sm750fb/sm750_cursor.c
@@ -132,7 +132,7 @@ void sm750_hw_cursor_set_data(struct lynx_cursor *cursor, u16 rop,
 	}
 }
 
-void sm750_hw_cursor_setData2(struct lynx_cursor *cursor, u16 rop,
+void sm750_hw_cursor_set_data2(struct lynx_cursor *cursor, u16 rop,
 			      const u8 *pcol, const u8 *pmsk)
 {
 	int i, j, count, pitch, offset;
diff --git a/drivers/staging/sm750fb/sm750_cursor.h b/drivers/staging/sm750fb/sm750_cursor.h
index af0211242ae8..8a1e81b8248d 100644
--- a/drivers/staging/sm750fb/sm750_cursor.h
+++ b/drivers/staging/sm750fb/sm750_cursor.h
@@ -10,6 +10,6 @@ void sm750_hw_cursor_set_pos(struct lynx_cursor *cursor, int x, int y);
 void sm750_hw_cursor_set_color(struct lynx_cursor *cursor, u32 fg, u32 bg);
 void sm750_hw_cursor_set_data(struct lynx_cursor *cursor, u16 rop,
 			     const u8 *data, const u8 *mask);
-void sm750_hw_cursor_setData2(struct lynx_cursor *cursor, u16 rop,
+void sm750_hw_cursor_set_data2(struct lynx_cursor *cursor, u16 rop,
 			      const u8 *data, const u8 *mask);
 #endif
-- 
2.30.2

