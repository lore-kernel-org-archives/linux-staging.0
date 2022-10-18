Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E8A04C64;
	Tue, 18 Oct 2022 14:05:01 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id m23so18018959lji.2;
        Tue, 18 Oct 2022 07:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cmkA2nahqdV5ZLpSxnhtvorkwi04wOolQrPdVytHYxY=;
        b=iWheTxqNCTGD6qvm2sGjasEQyED8ePFU44tPaGNDrpaJjoPe0dH+S41dNqxChtvW5M
         q5b/S3rYjJsIwrcV/pk7wvSkVGfCx2Xf8RtyRfFW2skFRLg80j+bzq4z20gDuB43J88H
         Edtntnqx/mw7GNiSJxZxAasKAM8SgN32D3DULcXHN2xFbIl//d5Al0K3CjeCXkyreBFf
         iw5823odvlMw5gBsnSB+SmEc+TO1ftMSfJp78de4cLSX/DaJyR9ZSCzjsMSIvExsR/xQ
         QhqAdsemR3fg5ETBkKvfFWfWK4q+MxO6OeCzHEWiJvUBmGzynSmqthjLyWmp9oYeztPY
         pwMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cmkA2nahqdV5ZLpSxnhtvorkwi04wOolQrPdVytHYxY=;
        b=JTQwS1bGGsPqmXnkmyI3PwZ79u8zAXms7k6YNki7riw8btW5TkbzwjTdSZJD4wpH+X
         UUsqOzo9pysavvhUL9SZ+9WtwahtgkntS0jR9Ag6p4LAOxx6hk6SnlVk0U1sMwjKJmVC
         1/JbNF5AgrqC1dvYSNrA3sC+ZHgc4Y49WwkKrlzXXMk3qEUBzO5zubH1ccYeu5e+lW/I
         vYVKHJQ8+0hJzzz+LRASiBbgYa1fwc4ylntwxdQtlj6sJ981JBqXVTaVOWvuZYaVVUtT
         oZ7OOj6TFd1Sa4kRcmIVGsuKEbk1E9KylngTOcgWk6lPDvQUUJN5F9pWpv7ae7C+yQm4
         xaPw==
X-Gm-Message-State: ACrzQf1sjwO72FJc2gaDfL+HiN/dYty57Ec4tN1p6APF7+dBq3pUn+BZ
	wMGYISlwn9dFbZ6NNo0zJoPCYGWUhWk69tCF
X-Google-Smtp-Source: AMsMyM7R+09+9nCvaMMUp+hbCV4Cov9DsqksHf3+0pMwbNT+EH5zakKKH6rKc72O2RgKizvbC1mVpg==
X-Received: by 2002:a2e:3310:0:b0:26e:61d7:870b with SMTP id d16-20020a2e3310000000b0026e61d7870bmr1210454ljc.88.1666101898734;
        Tue, 18 Oct 2022 07:04:58 -0700 (PDT)
Received: from elroy-temp-vm ([20.240.130.248])
        by smtp.gmail.com with ESMTPSA id l29-20020ac2555d000000b00498fd423cc3sm1859113lfk.295.2022.10.18.07.04.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Oct 2022 07:04:58 -0700 (PDT)
Date: Tue, 18 Oct 2022 14:04:56 +0000
From: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
To: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
Subject: [PATCH] staging: rts5208: Replace instances of udelay by usleep_range
Message-ID: <Y06yiBaluz6X0C4G@elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Replace the use of udelay by usleep_range as suggested by checkpatch:

CHECK: usleep_range is preferred over udelay; see Documentation/timers/timers-howto.rst
+               udelay(30);

CHECK: usleep_range is preferred over udelay; see Documentation/timers/timers-howto.rst
+               udelay(50);

Signed-off-by: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
---
 drivers/staging/rts5208/ms.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rts5208/ms.c b/drivers/staging/rts5208/ms.c
index 14449f8afad5..ae72437b5482 100644
--- a/drivers/staging/rts5208/ms.c
+++ b/drivers/staging/rts5208/ms.c
@@ -3235,7 +3235,7 @@ static int ms_write_multiple_pages(struct rtsx_chip *chip, u16 old_blk,
 			return STATUS_FAIL;
 		}
 
-		udelay(30);
+		usleep_range(30, 30);
 
 		rtsx_init_cmd(chip);
 
@@ -4157,7 +4157,7 @@ int mg_set_ICV(struct scsi_cmnd *srb, struct rtsx_chip *chip)
 
 #ifdef MG_SET_ICV_SLOW
 	for (i = 0; i < 2; i++) {
-		udelay(50);
+		usleep_range(50, 50);
 
 		rtsx_init_cmd(chip);
 
-- 
2.34.1

