Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 933BD70
	for <linux-staging@lists.linux.dev>; Wed,  7 Apr 2021 21:26:43 +0000 (UTC)
Received: by mail-qk1-f181.google.com with SMTP id q3so83510qkq.12
        for <linux-staging@lists.linux.dev>; Wed, 07 Apr 2021 14:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=YmJWVZVCE0nBAIyztMwblyzhG8DMCv0lWyvf1G3l0f8=;
        b=tXbIacZhePHp5cOIGIkAz0vDSH59OEMujhAtK+p39NvO0tijLukHQfj07YbwuWf7wW
         Ba3ofjdrbYEsgWq4jeHj8gC6ao7Sh0/Zig+K9/5C7WVqJFE3GjYRFU0PpFqaAYo+y+pV
         F1hIb6wvBc69dwwxk83PhR8cawOjUtz4mCxue4SgAypbQtWH8Ivoa9i2iDs703Ir6UoL
         Gdyf+YNwRMJNRaZdBRoU1j9HfnxYYes0vgw5KGETJPFHas+VOdjCEo9BezhqSmlLtk4L
         x036LpCazyXua/pk5SciE1KBJwE5Fq9wrhUivzerAnUNXBUMgYfz/smDZcG6Sbb6Iet7
         5g6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=YmJWVZVCE0nBAIyztMwblyzhG8DMCv0lWyvf1G3l0f8=;
        b=Ve9OwPD4xY0pl487RdoKIRqkjnvwt60JGvtx6WjHBF37c9T3wQNi//vKtfsBbbJ+Rj
         rNuN8USKYxiG0IU0HtekiF1uQrrW6hdcxGBxzifM78VuLn7B1djMw84HJt4/d64yDd6j
         G5Na+eC4WLMUVCKZUdmIwdURm4Uis4ODZzPAE5kaKsR20ZClEvZ/95n8MvzmOWNXyyyE
         PGNzRuTV8dbXEJMyH7xEawRSEYImptaKsSBtDEI2HrUz7ntE9dQUv9nrl1iQcpcYqjIc
         6x5f6zCphfyT8AoVgnCw3F90MT7IOM9QVtdk9AJfL+PN66hHJ2OrBg4DDOS2fcbGXJ1t
         7rFw==
X-Gm-Message-State: AOAM5303W+4AxAFYUdj1zSPLrD43bxatFfOC9GRk+Xh3OGGIEikG8T1Y
	p4tXDyoMOw7tM0Lak7AJrrA=
X-Google-Smtp-Source: ABdhPJyTOs5yeM5Gs/3O78S66x+F9OUD3cSYHCOFubhe/hcOv/0Vw50Ul4NBt9XWhiqUd/DiLT9t2A==
X-Received: by 2002:a37:acd:: with SMTP id 196mr5474432qkk.219.1617830802641;
        Wed, 07 Apr 2021 14:26:42 -0700 (PDT)
Received: from focaruja ([2001:1284:f013:b099:91d8:678f:6a0a:466d])
        by smtp.gmail.com with ESMTPSA id b1sm19858992qkk.117.2021.04.07.14.26.41
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Wed, 07 Apr 2021 14:26:42 -0700 (PDT)
Date: Wed, 7 Apr 2021 18:26:40 -0300
From: Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>
To: Ezequiel Garcia <ezequiel@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com, alinesantanacordeiro@gmail.com
Subject: [Outreachy kernel][PATCH 0/2] staging: media: hantro: Align line
 break to the open parenthesis
Message-ID: <cover.1617829497.git.alinesantanacordeiro@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)

Aligns line break with the remaining function arguments
to the open parenthesis. Issue found by checkpatch.

Aline Santana Cordeiro (2):
  [PATCH 1/2] staging: media: hantro: Align line break to the open parenthesis
  [PATCH 2/2] staging: media: hantro: Align line break to the open parenthesis

 drivers/staging/media/hantro/hantro_hw.h    | 2 +-
 drivers/staging/media/hantro/hantro_mpeg2.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.7.4

