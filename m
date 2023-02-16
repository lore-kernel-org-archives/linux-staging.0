Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 583467B
	for <linux-staging@lists.linux.dev>; Thu, 16 Feb 2023 00:58:09 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id jg8so1402002ejc.6
        for <linux-staging@lists.linux.dev>; Wed, 15 Feb 2023 16:58:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ezmrG/sOZbkfRK1NLR5fLERLXGxJdhb7yn9bDGpi7v8=;
        b=OfIq5oGygvJyp/wgd4xHbSY1M1Kqk3g7bGo3odmZB8EsIeG2FJiNSlCdaAmL7S8/Ca
         RJ3bFwo+l2GJdGWxWosjuIXTwewp12A2zm789qhrWjfbjJhyFNNKVs14n1odCZjRSzJ/
         /jo8iBIzInJTLvEfIz0rxgn1BoWqOL7XXrLDfEAgWhS0J9Gd6LY7rA2gU3onyoZ3e4Ls
         oAIfSRxuWgbVuiH3cvisWjGF8dWkm6Mv6pLvk7FsxH9Vx5ssZDw5VZUKwZbKeUmY2kJs
         Uq7n0V6fjqOR27Fnv9wq/TjeUdwvkhEAVS5hetzEQkFZyMuJQ+bTrG4MGWY1SGLxJAxi
         H4ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ezmrG/sOZbkfRK1NLR5fLERLXGxJdhb7yn9bDGpi7v8=;
        b=IR34PUjK9znJfn6p5S6xS36CE1SMudqIlIYCVpJF/9fnWakKEWLgCMgIU38EaKPd2v
         zIiyfQgHw3ecaykTIAAihuul2q+T1avVCtQKmvnpDEyKdyBNU0VtzOu/RarTwa6luTNG
         +DD2GWnseAjLLgRz/zANTZy7m/Ml3/WDErdf692iKdH4ep/Bz3A3mJAWdNr2qzKVXSnH
         jR/Zmv+EMrd3j1bdngU26qK63hPZCPci+pBWMefrYikKZsueqUVep80paiZikqKkdb9R
         C+jBvaQ1OW0MILx3bUsmS7RAWYwXinFkm/i9Zkw78u147//qlyK5BzS34kJTredmGEKP
         aFuw==
X-Gm-Message-State: AO0yUKWm0GRS2C4g4ya/NVSbAp/9f8/2ye5N1QL66SP6AUCd6zPjutGA
	pLfyfG5QydsqPmgpe0x6Ytk=
X-Google-Smtp-Source: AK7set+2OIGCsB09ZBMpZEveYY/8a0IjQJ+ZU0hsZ+BkXrje6Dl6j3EDX23bWoxXuMlBE/MR7Krpzg==
X-Received: by 2002:a17:906:4a58:b0:8af:4314:24a6 with SMTP id a24-20020a1709064a5800b008af431424a6mr4310464ejv.31.1676509087561;
        Wed, 15 Feb 2023 16:58:07 -0800 (PST)
Received: from smurf (80.71.142.58.ipv4.parknet.dk. [80.71.142.58])
        by smtp.gmail.com with ESMTPSA id w5-20020a1709064a0500b008b144796d9esm73458eju.143.2023.02.15.16.58.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Feb 2023 16:58:07 -0800 (PST)
Date: Thu, 16 Feb 2023 01:57:45 +0100 (CET)
From: Jesper Juhl <jesperjuhl76@gmail.com>
To: linux-kernel@vger.kernel.org
cc: linux-staging@lists.linux.dev, Hans de Goede <hdegoede@redhat.com>, 
    Mauro Carvalho Chehab <mchehab@kernel.org>, 
    Sakari Ailus <sakari.ailus@linux.intel.com>, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    Andy Shevchenko <andriy.shevchenko@intel.com>, linux-media@vger.kernel.org
Subject: [Paatch] [staging][atomisp] Remove unneeded version.h include pointed
 out by 'make versioncheck'
Message-ID: <4b9f2443-3360-bdb0-c4d4-7687db333d0a@gmail.com>
User-Agent: Alpine 2.26 (LNX 649 2022-06-02)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset=US-ASCII

From d0b9a59ac1bc69523b5cc8b2bab0b0e0b4bd0ab6 Mon Sep 17 00:00:00 2001
From: Jesper Juhl <jesperjuhl76@gmail.com>
Date: Mon, 13 Feb 2023 02:52:24 +0100
Subject: [PATCH 05/12] [staging][atomisp] Remove unneeded version.h include
  pointed out by 'make versioncheck'

Signed-off-by: Jesper Juhl <jesperjuhl76@gmail.com>
---
  drivers/staging/media/atomisp/include/linux/atomisp.h | 1 -
  1 file changed, 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/include/linux/atomisp.h b/drivers/staging/media/atomisp/include/linux/atomisp.h
index 3f602b5aaff9..3deffcb81683 100644
--- a/drivers/staging/media/atomisp/include/linux/atomisp.h
+++ b/drivers/staging/media/atomisp/include/linux/atomisp.h
@@ -20,7 +20,6 @@
  #define _ATOM_ISP_H

  #include <linux/types.h>
-#include <linux/version.h>

  /* struct media_device_info.hw_revision */
  #define ATOMISP_HW_REVISION_MASK	0x0000ff00
-- 
2.39.2

