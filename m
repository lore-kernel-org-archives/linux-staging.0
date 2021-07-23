Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F73B72
	for <linux-staging@lists.linux.dev>; Fri, 23 Jul 2021 19:26:26 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id h10so3035006edv.8
        for <linux-staging@lists.linux.dev>; Fri, 23 Jul 2021 12:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6ueAuxf/lNyOdA4+vlk737MiUjhl/bLNv0CuGyEc4Nc=;
        b=mkcnRNu9lAzOTk7nx1T9FtAkop2ntjLzNqVzqavUncUaaWaAAIBOZ4w46oiU1TelsL
         DzolxOZp2oKOl2ZakRdJHQBN0c7ejEzfGqwzbqcoBR00EoMZ8EtapD4KrY3qLHc+XDb2
         wTIZ6TOI8fNzbTGCTjoQJ1Ij6N1PsjAXVHMZF3EbiQ8cetduTTOfTjqzKMmJeWCnpwY+
         UsJbt9hKnH+jJ6IfaLkA3KRf74IDNUIjlnNPjyigvHvQdHwnasP94PVwbQuCF8VK7YcN
         mh9uv+UZGJrMzYT6WaFPX6VpLmbUqSHDiBlMK1nG8dGkzctbKgaNrrqAZG4chPDhHESE
         Ovyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6ueAuxf/lNyOdA4+vlk737MiUjhl/bLNv0CuGyEc4Nc=;
        b=ZUt4ZtmZxWeFEI3Bw7NQ4WN4FMaYhK9uOilejMVqU7+orkKKqklVHJPy6Wj4iNA70G
         vAavJYJwM9yk4QhZx+68PCq2E/LHqBuRT9lpCIfxVCM82al1zTlhMIbxu9f4O9pkAalV
         MyKT3wndopXUDN4KHow7oDtMRS8AUm6HgXOXDwQHC1mQAYkNfyUQE1zKadKUquLy091x
         YBFgJhsPgf++PZwWlM9Bf6enGUuPvm4Kq0z5mvK4XTbRJrUKA8EMtYDFaoRKC6x7Q/L+
         mbC1n13ExFmXStBf5+h02LFL46Ibj1M0IehMjg+GsDrOnRCwg9HmGNgXlrVZgkL2+oSe
         zvGA==
X-Gm-Message-State: AOAM532UimE6FcUvFKPgk4u/eN1Oi+R0823AGobpc9OBCgfxdRQxPdbz
	DZybRlfC0zL2SlAztQIhYCM=
X-Google-Smtp-Source: ABdhPJz/6fhKV5eLCepBP2fEQOuL5nmz+UwpzccIToMKBlbEc9cyeqB8eRt6mwF/pfHkTDA5pYok3g==
X-Received: by 2002:a05:6402:48f:: with SMTP id k15mr7343547edv.262.1627068384510;
        Fri, 23 Jul 2021 12:26:24 -0700 (PDT)
Received: from localhost.localdomain (host-79-27-97-200.retail.telecomitalia.it. [79.27.97.200])
        by smtp.gmail.com with ESMTPSA id v24sm14621129eds.44.2021.07.23.12.26.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jul 2021 12:26:24 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	David Laight <David.Laight@ACULAB.COM>
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [PATCH v4 0/2] staging: rtl8188eu: Replace a custom function with crc32_le()
Date: Fri, 23 Jul 2021 21:26:18 +0200
Message-Id: <20210723192620.10669-1-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use kernel API crc32_le() in place of the custom getcrc32(). Remove no
more used functions and variables after the changes made by patch 1/2.

Fabio M. De Francesco (2):
  staging: rtl8188eu: Replace a custom function with crc32_le()
  staging: rtl8188eu: Remove no more used functions and variables

 drivers/staging/rtl8188eu/core/rtw_security.c | 81 +++++--------------
 1 file changed, 19 insertions(+), 62 deletions(-)

-- 
2.32.0

