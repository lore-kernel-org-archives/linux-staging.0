Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 417DC3686
	for <linux-staging@lists.linux.dev>; Sat, 26 Feb 2022 04:25:38 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id e6so5012474pgn.2
        for <linux-staging@lists.linux.dev>; Fri, 25 Feb 2022 20:25:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=Fp8tS9Tv9uCsWH6vrg9RydV37obfExfUsNqz1M7URQw=;
        b=gAwNByTQb9WAk7MPfXqU6n8mq0gTMsBg0s07UhnpFy7iVZ7BGyO+fcZMiq1ckGgeST
         SPtN9ABVZSGJUMpwJiBgmjb+llU2FOqn0orQ/CM2hYu0upRAEc2AskxGiAkuDR4dueZ6
         GJuPYwt12mV9VHyCAbc8ZEANweruJ4SFj+zHNZm9O4vugdXzlJxPh4sr/NbtEfZ7P33y
         T7VPH9en9aAAkmXGot0rJkeLIZVA+jiz6x6dR5mZG8Vp0iPTcO01F70AHcHv1i3H8x2w
         Ht6uKu3tQ3anzoNnJ4B7D+yHxVA7G6VItDpJ+RYNo81rSW6HsGDolLaQIgap2L21yttM
         qy/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=Fp8tS9Tv9uCsWH6vrg9RydV37obfExfUsNqz1M7URQw=;
        b=yBnRZgxXRSL5He6wXTqDMoeWTt2NzsUgyt0dygZB+zxo4+qUJEpcFyrWUYbZ3eUCIR
         lt8ZxRiSkBpbkRftk3MpvVjmfLr8f7h+CNHFKx5NU47bygPz3xBaU6OxCr5pXtTPYyxW
         27GfX4HjsQuVJG+9BkLQYMMdqP3IX4wlz9ALCchQjuP6T2p51O5sJIKT8DXzl1kKh4mW
         +ae6PUmw98yX/QVkJToUkCrDhCnohHQDwqO0NZ+uQxrNIIUe4zBZMK+Zwn0UqzxO4xB6
         bkjF8i3NNOfhEfoEWme9hhHhCkckO52HOvX8qpD+FtppfmsTJ4vzI9Vm+w5wy9LeUxFx
         R04g==
X-Gm-Message-State: AOAM530euIklqBIsEIOVznoQZv+PEFMCbcEbjM5kCQ70QLmKKdRRIB16
	Xp3w2cPEk+ulvZ8MlotVsDk=
X-Google-Smtp-Source: ABdhPJzHQLmT4p//evrcfBLw6x6Xobkv89wYpaBw12Jpf3R4cHoxj+UYFlNw9jxJJ4iXYg8goHDYUA==
X-Received: by 2002:a63:2d05:0:b0:34b:3f1d:2fa8 with SMTP id t5-20020a632d05000000b0034b3f1d2fa8mr8844216pgt.447.1645849537593;
        Fri, 25 Feb 2022 20:25:37 -0800 (PST)
Received: from mail.google.com (122-58-164-114-fibre.sparkbb.co.nz. [122.58.164.114])
        by smtp.gmail.com with ESMTPSA id z8-20020aa79588000000b004e1dc67ead3sm4783050pfj.126.2022.02.25.20.25.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 20:25:37 -0800 (PST)
Date: Sat, 26 Feb 2022 17:25:31 +1300
From: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
To: gregkh@linuxfoundation.org, paulo.miguel.almeida.rodenas@gmail.com,
	realwakka@gmail.com
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: pi433: prevent uninitialized data from being
 printed out
Message-ID: <Yhmruyr2BUn0+3O3@mail.google.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

local_buffer is not initialised before data is passed to
spi_sync_transfer. In case spi* function fails then the dev_dbg
statement after that can potentially print out uninitialised data

this patch initialises local_buffer array.

Signed-off-by: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
---
Meta-comments:

- this change was requested by Dan Carpenter in a different thread:
https://lore.kernel.org/lkml/20220207100601.GF1951@kadam/

Patch dependency:

- this patch depends on the following patch to be applied first as
both of them change the same file:
https://lore.kernel.org/lkml/Yhla4a1Clpguoo2h@mail.google.com/
---
 drivers/staging/pi433/rf69.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/pi433/rf69.c b/drivers/staging/pi433/rf69.c
index e5b23ab39c69..3028018f0b45 100644
--- a/drivers/staging/pi433/rf69.c
+++ b/drivers/staging/pi433/rf69.c
@@ -782,7 +782,7 @@ int rf69_read_fifo(struct spi_device *spi, u8 *buffer, unsigned int size)
 {
 	int i;
 	struct spi_transfer transfer;
-	u8 local_buffer[FIFO_SIZE + 1];
+	u8 local_buffer[FIFO_SIZE + 1] = {};
 	int retval;
 
 	if (size > FIFO_SIZE) {
-- 
2.34.1

