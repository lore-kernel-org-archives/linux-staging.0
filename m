Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 759E717C1
	for <linux-staging@lists.linux.dev>; Sun, 22 Oct 2023 10:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fFvrbOTO"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1c9d922c039so18913085ad.3
        for <linux-staging@lists.linux.dev>; Sun, 22 Oct 2023 03:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697971175; x=1698575975; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gO2PwCgF6TrXzVHmmodaWvzoIahOuJS1U51meYcBm48=;
        b=fFvrbOTOwAqRhkGqZOGZvAEBDZFsf4KoMHe7evV9aGfOfDqVyvkaEud0AmqHEwoWmU
         Zz7cpPGtumXnSYKYDE8Gi6FfDNCacd958Ixx5CzSkLV7+sUTm2NztvKi91e5UIOwpCnv
         0iDHCnP7ZwcoZh/KNCeQP+Bp2Tln+MwP4GcoXtlZNm9EE7DCs8SUjQUG5zBpyCUUBsGW
         KrlHAxXV0TRRt8HKdNhPGzA/bS4GDoWKnDhuyo0lCQYV2e3E/9Z0vNq+tsCy4m4EHWWH
         E+pVB6k56BwtSAdn2Mt1JQHLg2dogrszDy94yA8SKB08yQWVvXg8KHCl/IvNNsI+Tlqf
         ORUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697971175; x=1698575975;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gO2PwCgF6TrXzVHmmodaWvzoIahOuJS1U51meYcBm48=;
        b=jFXTKGFbj2Yd4OM8vWVCnUeu1Khm5MdRYBqgnbYc5t3kUiiyv0hvdPE/YXJt1PC7wp
         Vq0qqkDjgJRGyA73Yw/i1YlaQda8CCdI7/charV9HnW/9iV+41kWncprkh57CBq3Ukeb
         cTq+Lsgq7m0xhOMelbGHyRbbJS54TyTkAA++Q3Vx5edtONEoxNsvlX/ehBSnk4hEwYJ3
         qNq1cM1qQJ0JKuRFr1gUeiDAWh+Tf69obmr1Jpk/7MPcdc9dO+Sb/1ZP6NVk9DFRpq/s
         SNju30wpXywBrXcYwobcMJ3ozUfYN2IBLpTzKzSgWeBwoR32V3PaNeNc03U8U5IjaBr7
         Ojtw==
X-Gm-Message-State: AOJu0YyQHBtl3Sj6CtBTRgC2Q/Jvb/ofIaQYT7nD2LxA59dy3ui0ibTj
	hzGQfDapniS2EzE3heL21dw=
X-Google-Smtp-Source: AGHT+IHupRxsxOf8XzGoXWmB8r0Ah50M32C5qqbdbbyGsvgkbv7FasfOKxiUO+T3TZZkMU49GZ1eTg==
X-Received: by 2002:a17:902:d34b:b0:1ca:7ec3:f4f9 with SMTP id l11-20020a170902d34b00b001ca7ec3f4f9mr8001564plk.32.1697971174684;
        Sun, 22 Oct 2023 03:39:34 -0700 (PDT)
Received: from ubuntu ([122.171.143.200])
        by smtp.gmail.com with ESMTPSA id f11-20020a170902ce8b00b001c5076ae6absm4269087plg.126.2023.10.22.03.39.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Oct 2023 03:39:34 -0700 (PDT)
Date: Sun, 22 Oct 2023 03:39:28 -0700
From: Nandha Kumar Singaram <nandhakumar.singaram@gmail.com>
To: Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: kumaran.4353@gmail.com
Subject: [PATCH 1/3] staging: greybus: Modify lines end with a '('
Message-ID: <827f8417afa3943e8b71910a7ba88ea35614dd2c.1697969950.git.nandhakumar.singaram@gmail.com>
References: <cover.1697969950.git.nandhakumar.singaram@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1697969950.git.nandhakumar.singaram@gmail.com>

Adhere to linux coding style. Reported by checkpatch.pl:
CHECK: Lines should not end with a '('

Signed-off-by: Nandha Kumar Singaram <nandhakumar.singaram@gmail.com>
---
 drivers/staging/greybus/camera.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/greybus/camera.c b/drivers/staging/greybus/camera.c
index ae49e37a87e9..feddceddffbb 100644
--- a/drivers/staging/greybus/camera.c
+++ b/drivers/staging/greybus/camera.c
@@ -267,8 +267,7 @@ static int gb_camera_get_max_pkt_size(struct gb_camera *gcam,
  * Validate the stream configuration response verifying padding is correctly
  * set and the returned number of streams is supported
  */
-static const int gb_camera_configure_streams_validate_response(
-		struct gb_camera *gcam,
+static const int gb_camera_configure_streams_validate_response(struct gb_camera *gcam,
 		struct gb_camera_configure_streams_response *resp,
 		unsigned int nstreams)
 {
-- 
2.25.1

