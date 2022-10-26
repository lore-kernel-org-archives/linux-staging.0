Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96A641110;
	Wed, 26 Oct 2022 11:06:32 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id j15so15189170wrq.3;
        Wed, 26 Oct 2022 04:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f8fw059w/DKGSzGISpKiD55jlFKGFxUmcqcrxLcKoWk=;
        b=L5rHIBQ3/dPpSeWOe9aN4GAPujJGcy+UIpAjXeVt+wCcGjILATyaGSYM5c7NpfVYIz
         KLhqOwdpJiJv5/Ys8yn+8p6C+KA2rTVjT8W3/FL+NuGNRk2X5mc4AX8cYrSvPbpGAqIY
         xnFClyAhyW97mvY2bgfoKJFCwzasqIEmLIOzHCDCQx8sULd7DYFgKb6qG5x32IaHMYOn
         O5fOhl6/7fTjnb/JMuRtIqWoXlemHQ2SaQE3ou0Em+YJTKPj01HxZKpSckHFoL8xWz+3
         p2JRuEeT1PYkK3lm5CDTjWN2WI1EsOeFBUjuPP/t8SMops1975KMa8eo+bp/uxnYyQAn
         Gwew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f8fw059w/DKGSzGISpKiD55jlFKGFxUmcqcrxLcKoWk=;
        b=zQKMTzjUwocSCsciBfT/0uFmCnGjYG6rR/WYlTBFTpv//iZ4/jxxU8pWy4djLnPnkP
         YdFfFeAe9Q1Mcr5r6ZqTrdM8GaFqlj+2ciDxPFJbcisaGBakzgXjjX2h+yDL7IpDQD8J
         fCgKHFoS3HAKTH/JoXB+6NKB3LQGxvJSGtFozoeVEimWcOf+kNFEPwwh2BADDp8QxA3u
         3dlyGfbDdIQXRRvc+gpmdS9TviocVjQfV1O/krPSO7jRjpl0k2LsxvixsDt2eCqITsCC
         y49xZT9fiYpHSzvuxqYdCEHk0yOpnIYspb7b/gxMBdAkvi56joZyvw/o+VHTnQD3uAUr
         qWWQ==
X-Gm-Message-State: ACrzQf1QyiQxKnibRefyDbc6y0LgJYS0o0OZiT4ak0woESEpHChxX5HG
	5j0veWMnUFmgsGTmdNyohDdcYnpA7KeQ06lC
X-Google-Smtp-Source: AMsMyM7oPIoIE/u7ZKsOay8p997qZyK/s4D5Ay9/yVEXL2Ya6jVDAv7Jo9S6B8DaLvpudGyjSiU2mA==
X-Received: by 2002:a05:6000:1ace:b0:22f:7201:74c0 with SMTP id i14-20020a0560001ace00b0022f720174c0mr28767128wry.216.1666782380391;
        Wed, 26 Oct 2022 04:06:20 -0700 (PDT)
Received: from rdm ([41.75.188.129])
        by smtp.gmail.com with ESMTPSA id h14-20020a5d688e000000b0023660f6cecfsm4867344wru.80.2022.10.26.04.06.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Oct 2022 04:06:20 -0700 (PDT)
Date: Wed, 26 Oct 2022 14:06:07 +0300
From: UMWARI JOVIAL <umwarijovial@gmail.com>
To: gregkh@linuxfoundation.org, outreachy@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH] staging: most: dim2: hal: aligning function parameters
Message-ID: <20221026110607.GA37960@rdm>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

According to Linux Kernel Coding Style, lines should not end with a '('
Fix-issue reported by checkpatch.pl script.

Signed-off-by: UMWARI JOVIAL <umwarijovial@gmail.com>
---
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

