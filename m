Received: from mail-oa1-f65.google.com (mail-oa1-f65.google.com [209.85.160.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14E3B18D;
	Wed,  6 Apr 2022 08:31:13 +0000 (UTC)
Received: by mail-oa1-f65.google.com with SMTP id 586e51a60fabf-d6e29fb3d7so2152913fac.7;
        Wed, 06 Apr 2022 01:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=S9flbCkJYuVABiicICutS8TqtTcgIuX5XFJ+AGVGGGY=;
        b=SDrOFDQpY8TrN61Lqs+EP5/M63Ben1p41dMcLTv+yz4Hd2sn8N/eBkIZ8aTuCA60ut
         j1mVjYZ5V9j7+Xyug71GPGIWtuxDN8EP4Ja4gZkV7E5Fu8tHOUhDhcUsdHs9x1uf+x/k
         9SEYi03YEDWC29kyKLSM4qkqXQ4i71sQgvhPCyXE23kxfSAWsX5+NJg5MpVOwZzvMorP
         dyT7IR6OnvnLm00qx+SGjp7V7nS6naLSjvuKWzr30FAadUt0swTklXNrN2S2ZQVXicNB
         NXgDZ7bOs+SSzyfClt2z7WbvJTITgaLGoiFlFIl4TplGCtoIU3jeN1R5I1qg3oAQi4gO
         HlIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=S9flbCkJYuVABiicICutS8TqtTcgIuX5XFJ+AGVGGGY=;
        b=gil9N5I8gXGZhQ7rrJqkgYuoxA5iceyazbOYaOo4wdtWN7aPAYId7eaau/o0uLzsNZ
         IIqL0hD8xxg7GcBICGS7RdhkYU2HxcrscrlbxbAhDZd7xR3SfmKN+Kw1bB1VjCaieNUb
         vgBrBvaldaxc+dSrzfCXsXuhYlq1gIXC9BDzU9be2UFIpj+i0cBGWuvuQJTBv0FOgvHT
         lKdNHyfJ8Y+TeQ9gqY60Bg0eeCfvtw8muqC3Y+ZEOJGJtSmwT7M4Oq2YYqPNChjswyok
         JS6By4SOS9qvyfTpsuYcX+KnLND3mPM/E1skp28pVw6juXTxEzyUYAnZbdDg/Z1GZIEC
         I1sA==
X-Gm-Message-State: AOAM530nZOx4JE5Jp+vhZstVQnTpzSbtMHMbWjK/oyNLapGaR6g37ZRt
	CfX5tZtqQHG4D+4jWXdaTdI=
X-Google-Smtp-Source: ABdhPJwQxMex7QdCiVZfJ/X40BVXFbIQs+k7npdRhHGZjrSb/ziy9wt+gF+ZrbVmmEjxle8qk+8YSA==
X-Received: by 2002:a05:6870:58aa:b0:dd:a976:5e8f with SMTP id be42-20020a05687058aa00b000dda9765e8fmr3447113oab.112.1649233873174;
        Wed, 06 Apr 2022 01:31:13 -0700 (PDT)
Received: from bertie ([172.58.102.145])
        by smtp.gmail.com with ESMTPSA id o19-20020a056870969300b000dea1b17aacsm1812813oaq.36.2022.04.06.01.31.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Apr 2022 01:31:12 -0700 (PDT)
From: Rebecca Mckeever <remckee0@gmail.com>
To: outreachy@lists.linux.dev
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Rebecca Mckeever <remckee0@gmail.com>
Subject: [PATCH 0/4] staging: r8188eu: cleanup of style and typos
Date: Wed,  6 Apr 2022 03:30:56 -0500
Message-Id: <cover.1649233201.git.remckee0@gmail.com>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These patches address style issues and typos found by checkpatch
or suggested by Dan Carpenter or Larry Finger.

Rebecca Mckeever (4):
  staging: r8188eu: format comments in drivers/net style
  staging: r8188eu: remove extra 'the'
  staging: r8188eu: correct misspelling in comment 'tppe' -> 'type'
  staging: r8188eu: use sizeof(*pvar) for allocating structs

 drivers/staging/r8188eu/core/rtw_cmd.c | 81 +++++++++++++-------------
 1 file changed, 39 insertions(+), 42 deletions(-)

-- 
2.32.0

