Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E65EB17736
	for <linux-staging@lists.linux.dev>; Tue, 27 Aug 2024 08:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724746733; cv=none; b=RSTulKYQJTgGfEguIOSXkZ6hEwNYkQSuA75o8ngcE/OsXl9yTGyar0W8l+JU6Ms7tyX198gP+ek6Dr7i76r7kvB1GUNvxNrEgMP8ZZYMMWkw6lMa/awr1F9d+5k1Y8vrcFr0WSJ66IUOTCstvcnRW85tjU6o2DEEj6MCDFUiQ90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724746733; c=relaxed/simple;
	bh=t9IGVRRdm8rEGT3/Jj7lU+fXIDHmB3sxw1FRiZjk4r8=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dmATG4PvHTgO8WkgX3tKX5jGowSnedVShhx5yRHyxJ1CWGrDVOSMQHdB+cO8DY4uAl5OUBW3HQv3+yXkoCtECYifQXApx8+b32VkYCKBePXgPHQIorTS6a5iBwOYq2O9kpxgCI38WqW56uC/S027THsVvNfAks7V2nVZQ7WK3Qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=acqLGsn9; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="acqLGsn9"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a86a0b5513aso424869466b.1
        for <linux-staging@lists.linux.dev>; Tue, 27 Aug 2024 01:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724746730; x=1725351530; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I70MSYbAc1AGHnHaOGdeVVD6i++V9UU7IxJECcqEc04=;
        b=acqLGsn9KedHAbtnauGQ3I4XkJaO/XiS0uMygmzah6YdG1K8xucHZzogpCHHGmYMo+
         +eUiD0mgSWOqDA2rtyAXVa/oZpRLl1vxY91xKosbFgkPoUia2YPVqqwDLu4RB6lyQ1iZ
         GjH9JyJu23gHsBvhDIpVml/hY9fcW99+tihfQxfhceCQdV30aQX9MIGmfkmbDCXISPb+
         7AIZ2nEUs9sLSaajnAxT3qfzbnuIsnioPgAl7bHWxqAraYc2HT6VXY4rXHTatjbapKLS
         4ZQKYj/F3oXINW2AqIoobdHJhsfCBMdr8ZJFXXzp3QaMHkAJ6REnaPrOF6YWcxrUEUBC
         qhdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724746730; x=1725351530;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I70MSYbAc1AGHnHaOGdeVVD6i++V9UU7IxJECcqEc04=;
        b=wOXEQlsaGt25bLqkf4BsPnuxrf2d+VeiisWJaW57IDjHUcMgXlQzE/mrbkbxEEULOK
         KArcrBEAN85SF7kXC49xNW5BpKLlIZpP/b/P/twYaVxfvmh9owm57hvY0b8LBE7GD8oh
         E9ML9FvXUeA0FwJlOuFdr8dRGtOr7CSyzplQWVEwyJqTP3CMPIpQvWFSzHh7tTEr2Bhb
         ZBMUpAVpbpiZpDfecYk+Xj8+jju6HJ3qv7aqm569hPwvr7rsBDxGHRIYYZUf2ymo3XaA
         xIFlJul8myMU0QvnO2r73VIXnsVpbWvp/ZR8QkPA9wisEqCFSNmrR3ClHPcUYJs2U55D
         RnRw==
X-Forwarded-Encrypted: i=1; AJvYcCUAYQwyfQxcO6+xr2twWXVUrNhkVNTzjKvjJHc2mNdufppGJjOdmZQRb7xAhEnubEDanWvq6RpYBIJ6rwBS@lists.linux.dev
X-Gm-Message-State: AOJu0YxH7Qw6Diao7aJmRh31LN3CHDOSUSx8z5b2zH94AxYpUukDTiHn
	J6otvArMZQkMG0snsQItEa+icVUtXMTzxBVDA6/t2gVyc1b22zjNbVfHDGzR
X-Google-Smtp-Source: AGHT+IEvD+pu/vLKN88m5xfnUGgU9GX0+asJE4mdQmyQ3pZT+JunQfaxXM2+DDLmVKefshg96reEJw==
X-Received: by 2002:a17:907:9689:b0:a86:8ff8:1dd8 with SMTP id a640c23a62f3a-a86a54a9387mr831255366b.46.1724746729544;
        Tue, 27 Aug 2024 01:18:49 -0700 (PDT)
Received: from ubuntu-focal ([197.237.50.252])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a86e54875b8sm78601066b.1.2024.08.27.01.18.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 01:18:49 -0700 (PDT)
Date: Tue, 27 Aug 2024 08:18:45 +0000
From: Dorine Tipo <dorine.a.tipo@gmail.com>
To: Florian Schilhabel <florian.c.schilhabel@googlemail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl87212: Match parenthesis alignment
Message-ID: <20240827081845.GA15504@ubuntu-focal>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Fix the parenthesis alignment in r8712_read_port() function to match
the opening parenthesis

Signed-off-by: Dorine Tipo <dorine.a.tipo@gmail.com>
---
 drivers/staging/rtl8712/usb_ops_linux.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8712/usb_ops_linux.c b/drivers/staging/rtl8712/usb_ops_linux.c
index 0a3451cdc8a1..4a34824830e3 100644
--- a/drivers/staging/rtl8712/usb_ops_linux.c
+++ b/drivers/staging/rtl8712/usb_ops_linux.c
@@ -221,7 +221,7 @@ static void r8712_usb_read_port_complete(struct urb *purb)
 			fallthrough;
 		case -EPROTO:
 			r8712_read_port(padapter, precvpriv->ff_hwaddr, 0,
-				  (unsigned char *)precvbuf);
+					(unsigned char *)precvbuf);
 			break;
 		case -EINPROGRESS:
 			netdev_err(padapter->pnetdev, "ERROR: URB IS IN PROGRESS!\n");
--
2.25.1

