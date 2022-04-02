Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5758A7C;
	Sat,  2 Apr 2022 11:48:36 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id u16so7670505wru.4;
        Sat, 02 Apr 2022 04:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sLXbcmO5F8pv8rU06HtWAEl2LZNlFUBFepYo7bqA8sQ=;
        b=YZ0ff4QfkkKYik0Vim4MSpP3bN0N0LcK+nM0VE1FGCerrllFUhIfVbhPJZSGOq9UY2
         rm++WGs1Uro1wZ9AqpC08iVStCTiZf9w+0aj6NM6GdHlV/IgA8MhU3YqTg9J3dYmoTmQ
         ESa/8d1mte243ArJihnXqBeB55SdB5UWhpcKzn20c1R7oUmV7kuuNY+qdcSTqCithHDp
         qn5TN4a2bFyfN52cjMmDBsc7elP1Ss8qh2mWnr9cyIRHruTO/eGkkq4sayiT4rpdHhhN
         hYHkqNk9GL4jqwSiYdjfYXQjf/3+EgnjMqUbRTYjP/KT0dB+8KYjety3U5a9NfpngyrB
         +Dng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sLXbcmO5F8pv8rU06HtWAEl2LZNlFUBFepYo7bqA8sQ=;
        b=dNi1ffZsKBF3R8BuATUYxdQTfhznBaLq3FPDboWmg0uH2QPzVpwr6X/9GlZ0nTg31p
         w36GXdYBhwyQSztg2Z3qbJuJt5W92k/Mz9o7dgW/6bPZ2NQPOGJ4kM2He3uOdQeA7+3E
         8At08VrdtSYtEQ7a2gzzHUEQsh9XitSUzbPvcpu0OzGOa2Gu+0NeFN50LcqFbYuEUFUP
         B1J5BO1gmLS31PViGJQNcvEVto9OgTED7953wFDxeImz6sdlXOi/X9v8n8ypCfb7YD6u
         lHnaI3TBhZ5GTXkNnS9/S0ebwj9AlB5bCdLO3ClBRohbTqDh6VLttqoXLbCc1AqPtccr
         6bEQ==
X-Gm-Message-State: AOAM532xYKADCRncJoqAdpSwwzFfzdn2uLcWL3ACnEe53lm+Qz9XXYBO
	DeB76o5TNqW1iisA8gBce+M=
X-Google-Smtp-Source: ABdhPJzlEQrZpBfNWxy5rUyYWm2MUxbS9tdhMq6oiwzO860+COc7AiCOzFMqZeStqkrybW2oOky2DQ==
X-Received: by 2002:a5d:6d8b:0:b0:203:f9b4:be1d with SMTP id l11-20020a5d6d8b000000b00203f9b4be1dmr11020010wrs.298.1648900114696;
        Sat, 02 Apr 2022 04:48:34 -0700 (PDT)
Received: from alaa-emad ([197.57.138.121])
        by smtp.gmail.com with ESMTPSA id v1-20020adff681000000b00205f21617d5sm4532563wrp.105.2022.04.02.04.48.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Apr 2022 04:48:34 -0700 (PDT)
From: Alaa Mohamed <eng.alaamohamedsoliman.am@gmail.com>
To: outreachy@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	jerome.pouiller@silabs.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	eng.alaamohamedsoliman.am@gmail.com
Subject: [PATCH] staging: wfx: remove space at the start of a line
Date: Sat,  2 Apr 2022 13:48:31 +0200
Message-Id: <20220402114831.14977-1-eng.alaamohamedsoliman.am@gmail.com>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix " WARNING: please, no spaces at the start of a line"
Reported by checkpatch

Signed-off-by: Alaa Mohamed <eng.alaamohamedsoliman.am@gmail.com>
---
 drivers/staging/wfx/main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/wfx/main.c b/drivers/staging/wfx/main.c
index b93b16b900c8..e575a81ca2ca 100644
--- a/drivers/staging/wfx/main.c
+++ b/drivers/staging/wfx/main.c
@@ -170,7 +170,7 @@ bool wfx_api_older_than(struct wfx_dev *wdev, int major, int minor)
  *
  * The PDS file is an array of Time-Length-Value structs.
  */
- int wfx_send_pds(struct wfx_dev *wdev, u8 *buf, size_t len)
+int wfx_send_pds(struct wfx_dev *wdev, u8 *buf, size_t len)
 {
 	int ret, chunk_type, chunk_len, chunk_num = 0;
 
-- 
2.35.1

