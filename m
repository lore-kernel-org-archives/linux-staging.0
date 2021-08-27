Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4D6C72
	for <linux-staging@lists.linux.dev>; Fri, 27 Aug 2021 09:41:53 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id v10so9476690wrd.4
        for <linux-staging@lists.linux.dev>; Fri, 27 Aug 2021 02:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TKt2tmYkZ0IptmRVmfOgQO1U+SQBIYl0R7WV2vqUGho=;
        b=cabkzZE1nV14beTnXHvEQ2SKv9m1DM8aNZk4QPtcfT27wQWld2aUEHQK4zc9gpI6g0
         rN0z0DvDMXhhtHHNQfxHo1qoz7x2eHHlX24WxTalD6xX4QOBwC+5FNUTi8TuVSqtC6mj
         RhL73T1piCF81qjSx4JYvjuxtRYhINI6g1V/DVBHHYGSFAlcsQ7KI3cZ7z/CaTOLTqYe
         sqEYH5BsuoOinINLpG2rMYho+GlU8yCxm9uXPjKaXekeviI2WbTjv5A8O+z9tzs5/5TR
         Xkqn1NpuW4XyA0xWcdm0mDk5jYPQfRI/ZNW8NP9W4xnY58ArbOPWQEMA0BUg6Duv/+kj
         GJVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TKt2tmYkZ0IptmRVmfOgQO1U+SQBIYl0R7WV2vqUGho=;
        b=RFfM/8N3AUXxL7pbzMQizpF6dh80XclPiiJIBHHbubclPr+2T/d7DAxzXVxBUm9oVw
         5+46/rvZ4v9fsXb/rR9PmSZW7BiTmRiqL1zq9p/rdctdzIMS1USzVUBGKknLiSAHH62n
         yODsLNEA6Eul5/hboPPpxbDvgyry/C87/IMWXgM2x3xE5ErcOWu0/VpZfNm7Ca8DU500
         i/kKZR9P09mM/y8VOYJJHPcF60DydnEgGe/rJUrmoYFC6A88xYfL8htSTwwn4+0dYIQy
         sNhhfUhG3axybdONBL6ffTF53RDqYCCGFl0NBxJ+An4OXANaXXbnFWZrGMJmYCrS5uH0
         KHZQ==
X-Gm-Message-State: AOAM530Si3kdrA6gpk/z+GCsdhr4q/2Hc91ZpZJDCSmMG/zrx1/muEfA
	0siLf6TNQ0xzyxLndqKSE0g=
X-Google-Smtp-Source: ABdhPJyaC+2XnLNLDpKrdhgqNpYzyUTOzvxHAGy71LThWc826IZqvNohubT3GGItQ2jw3820Estsjg==
X-Received: by 2002:a5d:69c8:: with SMTP id s8mr8796964wrw.324.1630057312200;
        Fri, 27 Aug 2021 02:41:52 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::884b])
        by smtp.gmail.com with ESMTPSA id b15sm6500034wru.1.2021.08.27.02.41.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Aug 2021 02:41:51 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 0/4] staging: r8188eu: clean up some camel case naming
Date: Fri, 27 Aug 2021 11:41:40 +0200
Message-Id: <20210827094144.13290-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series cleans up some camel case naming and removes the unused
function ODM_DynamicPrimaryCCA_DupRTS().

Michael Straube (4):
  staging: r8188eu: rename struct field Wifi_Error_Status
  staging: r8188eu: rename fields of struct dyn_primary_cca
  staging: r8188eu: remove ODM_DynamicPrimaryCCA_DupRTS()
  staging: r8188eu: rename fields of struct rtl_ps

 drivers/staging/r8188eu/core/rtw_sreset.c     | 18 +++---
 drivers/staging/r8188eu/hal/odm.c             | 64 +++++++++----------
 drivers/staging/r8188eu/hal/odm_RTL8188E.c    | 13 +---
 drivers/staging/r8188eu/hal/usb_ops_linux.c   |  4 +-
 drivers/staging/r8188eu/include/odm.h         | 21 +++---
 .../staging/r8188eu/include/odm_RTL8188E.h    |  2 -
 drivers/staging/r8188eu/include/rtw_sreset.h  |  2 +-
 7 files changed, 59 insertions(+), 65 deletions(-)

-- 
2.32.0

