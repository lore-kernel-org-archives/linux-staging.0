Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44D442206A2
	for <linux-staging@lists.linux.dev>; Fri, 18 Apr 2025 17:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744997705; cv=none; b=ZWu/a/VEYMUa7TNWPPiautTLHyPVSQJOoAb/4smvwqYHhyIKZSokasnCiELJ5RPPnPfy2fpGLp9NhpCewpFPntiDhM8DqCjusW3yKYpkaBYEwveeN927UXWI2PzZ+sxQdI5MIIQiMajuDh9x4L76rxXv6F9BYb5eKKErir3xG+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744997705; c=relaxed/simple;
	bh=4iQseaUFTpcev9Eu6hppJkJqT6uexmzYNKQtB62Erp4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fU8G3skcn+J/TOLE6pbHlgRoxO/Ggt0dnFmfAFpRGow24WU0PknUD+43CMhDhXm8JqI5vRyQqJQcu26wlCyPyhaeHnvOvQXdIaIoZ3mBgk+5gJJKJLa3B58XThQIY8zGLKNY8Ic9247cLFfTtSiwylhX5s1H7+5O4tyKzGkwfOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I4hfW6oG; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I4hfW6oG"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-39c1efbefc6so1303962f8f.1
        for <linux-staging@lists.linux.dev>; Fri, 18 Apr 2025 10:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744997702; x=1745602502; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OnBmFXSxRbz0DmRCSR8jCc12+Aku4V6y/rAuR5Mgcos=;
        b=I4hfW6oGcTBVUmVRv1y4nuR3sOGIobLzAB+25VhneWj7WoaA3V7I51qVwEo/YIpvhu
         IBWglPAro4hhRAtkL1EB+dWz3BEMBWHyUfdTfXgfnQRqJEnxQGsmuho0EW6cioX82pn4
         5BxKSjiRut8z/Rh5lKnye8o+IkHymbtRn9z2j2Eg3zHGnrtaUTouTrql+wknRG/mzWxl
         JZGzlK6zsbqEV3d1dMgUumv0DgsHX3DykhxrrlEtrgdxGailLXdzzFzu5QoKT28cegDt
         rhBEsunHE+uiVe/m9yDXkUjNF8F4BH8l1IjD8muTal/pUtoGiccAQcAjw+zvwxVC6bXG
         l9Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744997702; x=1745602502;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OnBmFXSxRbz0DmRCSR8jCc12+Aku4V6y/rAuR5Mgcos=;
        b=R3bpoyvYR7ufdr+bG24t/UBx8ALHntIqz1lMs7a63wLrdRCn8elx67ehLioObaFGAg
         srwdEqtLwXcEGERbLFgmuNnQLggR7qx8QX/2FOjHQfBmRdXnLPBWFzwU6VK2Vt0uuvY0
         GydxgswLJli5zK1HzHblwYkKBx4hE8SNjNckPznFoc21ZrYueqslEA/mPKq0o6km85Ex
         RTApjd83urqcPXapfhM86TYoMNiXtyot1A25nRIHF2LW69hDVb/RKJTutefPYTLJguga
         QLYVv6oz3RUZiJO97ZRX4haqOXNN583Lte8MzUN7dgF/h8B3XyimPbZj8OcZwuBHz/+s
         2kYw==
X-Forwarded-Encrypted: i=1; AJvYcCVGESOAeFtU+ABHOZNG6AMYCw04xSR7EK8F7nZVCbA8cYFsqHF8UikWIUBzjPeP1UmUveFstDpCPWJ+IoIJ@lists.linux.dev
X-Gm-Message-State: AOJu0YxzKYsSGAE9UQ/foHmNB9UwjSGsiXirzsiY8IEaNBuRIhFROxjr
	6iEHLekMb3rAc+SgM79ilOtoHFZaRtyPqlEYK/BU0ESE3IAJP1KX
X-Gm-Gg: ASbGncva342hsE8fCw2wksNB9WOZwfIu0iEtJ2NxJx9c+n1o7aq32YY5szFLsb5aGgv
	4CXIu3SwPKVbWGSbZ7y5qeLYr832usocRa/ntnc0YyJ1LpxyVAwFcF3+Izc3CiV59iHjWJkFPDD
	pl2I7h7N2t9QiimBEXlOF/jiCENagk2a51W67/ngjb6qu1tI77W3DFnkchwM0HVkWoZfTigm7/k
	JlLlN5c073Bdm5xMRCXRvApSClKwTkV4dSWnxGv72NixQppA2FvfqZma6xYb/Fi0XqNcNkXHwMh
	iinMPK5HP3sr9q6q8bKOGQjfVJiflbXxATP9P37XEtMmMol6dv/gwoMhJ+6znINzqofPC/jwA9B
	n
X-Google-Smtp-Source: AGHT+IGARWePzoNyOWwMYXMMy4aIxfc8BB0KzJuF4hy3VaEJfNzI0IEJ/V9IylH7RJ+z9tUcrQEI8g==
X-Received: by 2002:a05:6000:2503:b0:39c:30d8:a80 with SMTP id ffacd0b85a97d-39efba3c88dmr2523714f8f.19.1744997702450;
        Fri, 18 Apr 2025 10:35:02 -0700 (PDT)
Received: from localhost.localdomain (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa4332f8sm3287320f8f.40.2025.04.18.10.35.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 10:35:01 -0700 (PDT)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: marcello.carla@gmx.com,
	Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH 6/8] staging: gpib: Change error code for no listener
Date: Fri, 18 Apr 2025 19:34:32 +0200
Message-ID: <20250418173434.2892-7-dpenkler@gmail.com>
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

When doing a write a test is made to see whether there are any
listeners. The code was returning ENODEV which is incorrect.
The user library translates ENOTCONN to a user level no listener
error code.

Change the error code to ENOTCONN.

Fixes: 4cd654f84769 ("staging: gpib: Add gpio bitbang GPIB driver")
Tested-by: Dave Penkler <dpenkler@gmail.com>
Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
 drivers/staging/gpib/gpio/gpib_bitbang.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/gpio/gpib_bitbang.c b/drivers/staging/gpib/gpio/gpib_bitbang.c
index 1d650cb57cd2..86b98eb1ce69 100644
--- a/drivers/staging/gpib/gpio/gpib_bitbang.c
+++ b/drivers/staging/gpib/gpio/gpib_bitbang.c
@@ -516,7 +516,7 @@ static int bb_write(struct gpib_board *board, u8 *buffer, size_t length,
 		   gpiod_get_value(NRFD), gpiod_get_value(NDAC));
 
 	if (gpiod_get_value(NRFD) && gpiod_get_value(NDAC)) { /* check for listener */
-		retval = -ENODEV;
+		retval = -ENOTCONN;
 		goto write_end;
 	}
 
-- 
2.49.0

