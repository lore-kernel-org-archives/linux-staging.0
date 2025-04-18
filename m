Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 453C321A459
	for <linux-staging@lists.linux.dev>; Fri, 18 Apr 2025 17:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744997699; cv=none; b=LQ5WP1TA/vF7kPOkNDyieF0x2Uy6auaKNUug+skZoZYuqU5q27mBf1WV1Gl+KEUQa3hCwSJXTMsS5slkEfNbewVajL4TZZuZPnnWPD96+cKnKGfS5Xo3IR2g1Y9gz01y4yxsOel+mF3q2ps5tp22t5M0nif/T7xYViskJlnb/XU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744997699; c=relaxed/simple;
	bh=912DhBbNZi7td2eyvaGCgvKiyTa/PfJmPgJRBuo1gJ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rYVdOdcedTnBfyPkMeCy5cwernlQIU4rZ09gpCO6evo8m1kPZVazQ/QXLghzhMxsFUXuegNrz/eCIAsE0kZ/ZqcfsX7uPnzaifahm9mLrSWSLh4aiih/lhGAC1idRPtNa6MOUxER5VdKw5F9uxGEOP8b4ULuGJKvB/FM74lpPqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F8COEb4/; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F8COEb4/"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-39c266c2dd5so2214952f8f.3
        for <linux-staging@lists.linux.dev>; Fri, 18 Apr 2025 10:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744997696; x=1745602496; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E+FOcgEbgZOR6HUZYr+EJt4u9kEg2pRhCKDSCtJHjy4=;
        b=F8COEb4/UMfTLlQtIkwz5CAEJYNfsFu2zHrEBcCriX3iQJTujG/bv7AKIZgkXGnpOB
         +C/zL6vO9Pi8rO5rkvnHyuIJ7pXaiZdjeWTUD5AHc+21wbra9ntnstTjGrdpkvigvWts
         UyRMHksFrBRnh7Th5CtIjDP132f+krNgqjDDhjBZYTJ11+BtEUGMxksyDoUI7UJFzciX
         gvpdYubhVlZbxgWvJ4kgokcHElw5snnA7UiQsmc+G+U4DUdQMAxUaVOoRaNkL0SomgHh
         EFm469Mf4PpoNJjr1aEjsPyQIiUWrD7RMe7OSCCEiN+atok/dZeH69AIgXSXBJ8mhOGA
         BfDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744997696; x=1745602496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E+FOcgEbgZOR6HUZYr+EJt4u9kEg2pRhCKDSCtJHjy4=;
        b=G2vqf4LVejTpJ80hScC0WZjQMIVPmw5fkU60esIiOV94fbOcZ8jcgT3OVAP5TspYtr
         cPTqb5Zr3iqXjCqzIk5Y/nv37V3z19Cu1lsKEIvL9XPvW5UOKi4yyGFuxEIvty/zX4eg
         pDqZSQmy68Tb25FjiLQqmSz8Q/zwA07jJknPDGDWgs6Xjuv68/2GOEGBM64aGBUfDDJi
         TBbq0UuLYLuaZ2MFID6AF2CHpKVs5jeaXtodhICkgY1eu1RrmGp5C4gdo4S+/Fen/GAI
         V5z5T/LGzyh2VZvVthE8qfDVzyLkpX7H9TuTI0c5RxLF9B60Msfl9zgeMEM4yXwUqSmh
         m0XQ==
X-Forwarded-Encrypted: i=1; AJvYcCWpMCkA8UAC/foA8i/8CW4HmoZmPSinAQnWO2CfGgHJFKyarwhhmvERhHfXiwkvyAPeETsy24o/Tn26ApE4@lists.linux.dev
X-Gm-Message-State: AOJu0Yw+hLgTw0YHqppwcNlL93/GiYhoCA/jtKEh9usyUr065D8yi5TG
	/Qt0pL85CoB9ApQW9dA9DsuUx/xSBtTLIEXV/BooGnEx+IivodwB
X-Gm-Gg: ASbGncuRPt97BQ6+EgMAoGxkdWjXRVBwTT+mqDnY9hSjjgh8GvMNdI8u+htqj+G7CuN
	SxelwEYTI+rVI0+8qKqMCSuyG0cWv2jW0ddHIQHNBKFMGbQ34gbGFKM68UID9hJeQjgLrD4stsP
	AvF6rM4a3/lXl+g3sKzkVmEoZT1cQN4iO600uJDJqYTxZyA+4Yz80wt1xto+UEsSf+gvLsBnh8D
	dXjRfGdXvnK0hhP9anWWqxv7Qla55gTiDGfJO1k48GXTqC9qPO1uP8UnCA3/OxaSKpfj5ZmwO+3
	iu4O+L26f6SsfHcZPCzqye25Jo9uS187PwTfzYSi4mGOyQXS/87FmoSOIjLYPIJyn20YgpmmtaL
	6
X-Google-Smtp-Source: AGHT+IGb8/57K9ai+Ha6SyUvyBZ3Kwj0AjmdglALiUn63qt13/kokBa+B6jbxML43drs8/ss8E7FNA==
X-Received: by 2002:a5d:5987:0:b0:39e:e438:8e4b with SMTP id ffacd0b85a97d-39efbaf6e96mr2691275f8f.50.1744997696571;
        Fri, 18 Apr 2025 10:34:56 -0700 (PDT)
Received: from localhost.localdomain (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa4332f8sm3287320f8f.40.2025.04.18.10.34.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 10:34:56 -0700 (PDT)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: marcello.carla@gmx.com,
	Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH 2/8] staging: gpib: Fix setting controller-in-charge
Date: Fri, 18 Apr 2025 19:34:28 +0200
Message-ID: <20250418173434.2892-3-dpenkler@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250418173434.2892-1-dpenkler@gmail.com>
References: <20250418173434.2892-1-dpenkler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The gpio board can only act as system controller.
By the IEEE488.1 standard a system controller becomes
controller-in-charge when it asserts the interface-clear control
line.

Remove the setting of controller-in-charge from bb_take_control
and move it to bb_interface_clear.

Fixes: 4cd654f84769 ("staging: gpib: Add gpio bitbang GPIB driver")
Tested-by: Dave Penkler <dpenkler@gmail.com>
Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
 drivers/staging/gpib/gpio/gpib_bitbang.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/gpio/gpib_bitbang.c b/drivers/staging/gpib/gpio/gpib_bitbang.c
index 29aab72c1f0f..a92c4eda99a0 100644
--- a/drivers/staging/gpib/gpio/gpib_bitbang.c
+++ b/drivers/staging/gpib/gpio/gpib_bitbang.c
@@ -872,7 +872,6 @@ static int bb_take_control(struct gpib_board *board, int synchronous)
 {
 	dbg_printk(2, "%d\n", synchronous);
 	set_atn(board, 1);
-	set_bit(CIC_NUM, &board->status);
 	return 0;
 }
 
@@ -908,6 +907,7 @@ static void bb_interface_clear(struct gpib_board *board, int assert)
 		gpiod_direction_output(IFC, 0);
 		priv->talker_state = talker_idle;
 		priv->listener_state = listener_idle;
+		set_bit(CIC_NUM, &board->status);
 	} else {
 		gpiod_direction_output(IFC, 1);
 	}
-- 
2.49.0

