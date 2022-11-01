Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C6557E;
	Tue,  1 Nov 2022 10:57:35 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id sc25so35981153ejc.12;
        Tue, 01 Nov 2022 03:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MzqF9B0T/NfF3Y4vRqndF5M9IfCaL8dvD7GSKzyTcP8=;
        b=lQGDwX/mWuxEUr0j4yMjkVoxpOFzdmm9g1Sds8p+12S6LSzemeZIlDx96T/pzJgZws
         otH531H7MNRSIYOaMAJQGEn4AaAn0OAg3BLD/bdvAILXP79FRy3qpeCXqULMs0lyZUtt
         cVP+8vQOwsLGNLoQgF5g5245kxFB0uAAeIHw4bb1KDxbB3ALNJwBrCs+DZqRgaOtxhKm
         LryB8E4YQfIOhD2IJCwsZEYrXGLpoGenJvhpxch/+NPwTbBQwInV8xxIoAOwKmWwPKSY
         5QtB9kZA5Ghzgx6X9KUcUzYqnde4yEpKX4TaPWJsMmIk2146abylK5y80KLEdTeX351K
         AVVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MzqF9B0T/NfF3Y4vRqndF5M9IfCaL8dvD7GSKzyTcP8=;
        b=cl4tpMqcJJqhWQ9kwHg0rwFQa/lLma9oaSzc4d8G66ROxryQSD5xoAtQmHNGahPaSV
         AyQtCyLkGDeUAgbh28/qfk4sveVkcrzObok59J4qUTYTGwIi1OxXpUH7oX12SfPMBwf9
         RFAxeGOusO6XT/jrxeWhw7GRd3o/oQvrl/Av8XGAWLUGz+wNixbIAmGzUTjzBm/raswA
         H/xjHfhFeXxTpbbLKEN6WU+fPJBHgpKPHHfqXeZU7AFs5eqmXKGRaBmHVVXZ6tpx7eUM
         A8W7xAQ6aaDFWRd7gwEnO/HQBCaGxXtImF4CwTIId4U9dPH7wtvtkBljJ4tx5ckHnC8/
         H1Ow==
X-Gm-Message-State: ACrzQf2RsanS7zeBmyzIjyVKU/V5K3bOvd2nLXqfuI2xo6slLyHZ8SSe
	KgfEcusKOa54ngBhPrh9jN8=
X-Google-Smtp-Source: AMsMyM5TlyWQMlfm4DDf8XjillnEJmZCm2eqgKjjRdzFp6MIN+0BwxHVhyeClBW4dYDu1dWcQ7SUyQ==
X-Received: by 2002:a17:907:7f02:b0:73d:dffa:57b3 with SMTP id qf2-20020a1709077f0200b0073ddffa57b3mr18307043ejc.19.1667300253693;
        Tue, 01 Nov 2022 03:57:33 -0700 (PDT)
Received: from rdm ([137.63.146.164])
        by smtp.gmail.com with ESMTPSA id p3-20020a17090653c300b007adf2e4c6f7sm368781ejo.195.2022.11.01.03.57.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Nov 2022 03:57:33 -0700 (PDT)
Date: Tue, 1 Nov 2022 13:57:27 +0300
From: UMWARI JOVIAL <umwarijovial@gmail.com>
To: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
Subject: [RESEND PATCH v3] staging: most: dim2: hal: aligning function
 parameters
Message-ID: <20221101105727.GA162791@rdm>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

To improve readability, start the list of
function parameters on the same line as the function name.
Issue reported by checkpatch.

Signed-off-by: UMWARI JOVIAL <umwarijovial@gmail.com>
---

Changes in v3:
    1.Updated the commit message to well explain the  changes made 

 drivers/staging/most/dim2/hal.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/most/dim2/hal.c b/drivers/staging/most/dim2/hal.c
index a5d40b5b138a..6abe3ab2b2cf 100644
--- a/drivers/staging/most/dim2/hal.c
+++ b/drivers/staging/most/dim2/hal.c
@@ -346,9 +346,8 @@ static void dim2_clear_ctram(void)
 		dim2_clear_ctr(ctr_addr);
 }
 
-static void dim2_configure_channel(
-	u8 ch_addr, u8 type, u8 is_tx, u16 dbr_address, u16 hw_buffer_size,
-	u16 packet_length)
+static void dim2_configure_channel(u8 ch_addr, u8 type, u8 is_tx, u16 dbr_address,
+				   u16 hw_buffer_size, u16 packet_length)
 {
 	dim2_configure_cdt(ch_addr, dbr_address, hw_buffer_size, packet_length);
 	dim2_configure_cat(MLB_CAT, ch_addr, type, is_tx ? 1 : 0);
-- 
2.25.1

