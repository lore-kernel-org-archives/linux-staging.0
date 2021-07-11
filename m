Received: from mx2.ucr.edu (mx.ucr.edu [138.23.62.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4095570
	for <linux-staging@lists.linux.dev>; Sun, 11 Jul 2021 20:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=ucr.edu; i=@ucr.edu; q=dns/txt; s=selector3;
  t=1626035093; x=1657571093;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=knolZgBhatuIwg555Bgxz2YLsAZpb8GlB7yQJDayxi0=;
  b=nWmE3PJf07FxdYyL+AwD6XukG55xEI9qQoLvBbW5moAC2ZkoYtA/3V//
   inFHQjryvDChMMv+baNgPxecOVpOVHa7J1XIhk5/3m91yhOzjzhqbntha
   PcsEuHKjLoLznWmbPpJZ0fJrdPiRu4IXZ5Dqip8beobVayQ+hdpVCT0SB
   BdRo/SYu0dIFxwtyaXd1JLk7wUIbPuOghYKBL31XyMKz1QmDEziWgC8go
   p/hoYYlASg2EP0jwcqogMQsCwMlATXyp6rCvonAPuBWL+V0Kc3LSZjdqa
   5E4z2w0XbXPgSAZoEuPEnQ3x6AtnEeBHC8UKF9FqH3QL8A67T92EpcEip
   g==;
IronPort-SDR: NoG25QXyIZ448iew2SBqB0alxX9LL2zxrJ+O6l0kLwEdSPtz3pawi/w5CiXwDh4j84gruBJfNH
 yODKeCidvOMwX++Zb4eTAuqDRPCkKpoJhqtU04Ewyu35elSc1VE82uJpf1r7RAwIdL78Br0juE
 fnQmVwjmk0IPN/r37aBAVBduwQ7Fv6BgSXtBuDxYlgUV0KuMZCIfJeKxeeKiaTM8XYEqTeLjtI
 jrGkV17ALIR9eF+DFeZeYX2hBXrY6mxr4RhuijXcpFc23WlYovrod5mKhHM8NvH4fW04vABh7h
 rMA=
X-IPAS-Result: =?us-ascii?q?A2EhBwDDUutgf8jSVdFaHgEBCxIMgg4Lg3lVFo1Mhw4BA?=
 =?us-ascii?q?QEGjCIYgQGGeohmgXwCCQEBAQ0BAT8CBAEBhFSCewIlNAkOAgQBAQEBAwIDA?=
 =?us-ascii?q?QEBAQUBAQYBAQEBAQEFBAEBAhABAW6FL0aCOCmDZQsWIAFGgRUBBQE1IjmCF?=
 =?us-ascii?q?gGCYSacO4EEPYxkgQGILwEJDYFjCQEIgSiIe4UXgRmBEIJQgTN1h2+CUASDF?=
 =?us-ascii?q?3sTg3kBAQGTT4s4nQUBBgKDChyDDpsMRYZgjlmRGAEttjiEHQIEAQEBAwcGE?=
 =?us-ascii?q?COBOIIVTSWBbAqBQVAZDp0NITI4AgYKAQEDCVuLIwE?=
IronPort-PHdr: A9a23:ic3GrhNLZB8egcpL9cEl6nbaDRdPi9zP1u491JMrhvp0f7i5+Ny6Z
 QqDv60r1QeCA9STq6odzbaP4ua4AS1IyK3CmUhKSIZLWR4BhJdetC0bK+nBN3fGKuX3ZTcxB
 sVIWQwt1Xi6NU9IBJS2PAWK8TW94jEIBxrwKxd+KPjrFY7OlcS30P2594HObwlSizexf69+I
 A+roQnNucUbgI9vIbs1xhfVv3dEYetbyX5sKF6Jgxrw+sK894N//ipNvP4s69ROWrjgcaQiS
 rxYAjUmM2Qr68DuqBLOUwiB6GYCX2sPihZHDBTL4x/8Xpfqryv1rfF91zWAPc33Vr87RzKv5
 Lp2RRDyiScHMzk58HzLisF1kalWrg6tqwB5zoXJe4yeKuZwcb3BctMbXWpBX9heVypdAoOnc
 oADC/MNMftEo4XholcDqx6+BQi3BOP0yz9IgHD21rAk3eo4DArG0g0gEMwKsHvJsd75MKkfX
 fywwKTOyjrOc/1b1Svg5ITRbhwtvOyHUbZtfcfRzEUiER7OgFeNpoz/Jz6b1voDvXWV4eRjU
 uyghGEpphptrjWs3MoglpPEip4Jxl3C6C53wJw1Jdq9SENjY9GkEZpRtyGHN4txX8gvRGFpu
 Sc6yrIcuJ63YDQGxZo8yh7Cd/OHaZKE7Qz+W+aMODp1gm9ud72jiRio60eg1vH8Wdeu0FZMt
 idInN3Bu20Q2hLT9MWJROVx81uv1DuPyg3e6O5KLF0qmaTVNpMswLE+m54dvEjfHSL7mFj6g
 bOLe0g5+OWl7+rqb7P7rZGfL495kh/yPrgql8ClAuk1MhICU3aG9eigzrHv41H1TKlSgvErk
 6TUtIrWKdoVq6O5GQNZzIcu5wy+Aju61tkTgGMJI0hfeB2diojkI1TOIPflAvihm1msizJrx
 +zePr3mH5XNMmDPkLf/crZ57E5R0A8zwspe55JQE70BOPzzVlLouNzWEBM1LxC4z/zoCNV60
 YMeVmaPDbGDPKzOtl+I4/ojI+iKZIALpDbwM+Yp6+LqgHMjmlIQfbOl0YUKZHykBPhqPVmVb
 Wb0jtcEC2gKvw4+TOLwiF2FVD5ef3azXqM85j4hCYKqEZvPS462jbycwCi7BIdaaX5bBVCRC
 XvobZmLW+8QaCKOJc9sijgEVbmnS4882hCirRT6y6Z9Ierb+y0Ys53j2cNx5+3SjhEy6Sd0A
 96Z02GMSWF0g2wJSyUr069hv0wugnmZ1q0tsv1KFcFUr6dYQAczNMaElMRnAMq0Vw7cKITaA
 G26S8mrVGliBuk6xMUDNgMgRr2f
IronPort-HdrOrdr: A9a23:X49jcqm3/kIVxhgjllhMbK1sHmXpDfIR3DAbv31ZSRFFG/FwWf
 re+cjzsiWE8wr5N0tQ/uxoVJPwIk80lqQFmbX5Q43SOjUO0VHAROoD0WKL+Vzd8kbFh4pgPM
 lbAspD4R7LYGSST/yR3OB1KbkdKaG8gdmVbC7loxlQcT0=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.84,232,1620716400"; 
   d="scan'208";a="163893604"
Received: from mail-pf1-f200.google.com ([209.85.210.200])
  by smtp2.ucr.edu with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 11 Jul 2021 13:23:44 -0700
Received: by mail-pf1-f200.google.com with SMTP id h6-20020a62b4060000b02903131bc4a1acso11106355pfn.4
        for <linux-staging@lists.linux.dev>; Sun, 11 Jul 2021 13:23:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aSJsemQuEJggnAB9yPIA6lDwcxwNnBl6SI50zavXFPE=;
        b=hSPiJu1XP3cKdqY+GuDOhCY+scVMEHQYmpx6QqETSEbVApAJzyFCD8uXGWKZQo6BSe
         9HF32cB43Mzat79QcQebHk06eXs+TEz6XM7xXTQ5d1vj92GCSmMtkBH+A/F5KgL+iCfi
         vnhoJWN2USvAPuxdFgWS2qZvqQcc7563X//KHJnhRxTTuC7GGvwtjhxbN9gKWt9ihrkD
         j3/ZFZLUNeFSwkJa16t3qVXW6Yvp1fRAqZVp32l0BuVFaNX4+/YzWEfqrTXeirLWWJ1E
         FD5G0Jnt1z0vE9XdOc7JORERxiwxSZeAtq0Fn+XxuXU7Rmb4FXTsc9iREV+akKqZg7cU
         leIQ==
X-Gm-Message-State: AOAM532+ARz+UaDF1azWKjvFSRgsfIHljwzbKf2KEc8uStby3pcZj66i
	WhIA4woJKVKQFQ5nFYY8JvO0wd70+AChhh9r7e9NhrjTBAJF37LX9LHkTpdYzcy+GOtfBt9oc/y
	+hEI5p4uNzYmdilfSVFILbV94SEk=
X-Received: by 2002:a17:902:9b87:b029:11e:7c15:a597 with SMTP id y7-20020a1709029b87b029011e7c15a597mr40411348plp.6.1626035022828;
        Sun, 11 Jul 2021 13:23:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxluD4OhWJyegly9NdVTbZoCzN/+hubXRoiMZtpc8eeGRXGkRv8qro8QAoIpFG6fP3ZnpWpww==
X-Received: by 2002:a17:902:9b87:b029:11e:7c15:a597 with SMTP id y7-20020a1709029b87b029011e7c15a597mr40411331plp.6.1626035022598;
        Sun, 11 Jul 2021 13:23:42 -0700 (PDT)
Received: from protoss.cs.ucr.edu (protoss.cs.ucr.edu. [169.235.26.60])
        by smtp.gmail.com with ESMTPSA id b33sm14628997pgb.92.2021.07.11.13.23.41
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 11 Jul 2021 13:23:42 -0700 (PDT)
From: Yizhuo <yzhai003@ucr.edu>
To: 
Cc: Yizhuo <yzhai003@ucr.edu>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: staging: atomisp: fix the uninitialized use in gc2235_detect()
Date: Sun, 11 Jul 2021 13:23:32 -0700
Message-Id: <20210711202334.27959-1-yzhai003@ucr.edu>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Inside function gc2235_detect(), variable "low" could be uninitialized
if ov5693_read_reg() returns error, however, it affects the value of
variable "id". The "id" is used in the later if statement, which is
potentially unsafe.

Signed-off-by: Yizhuo <yzhai003@ucr.edu>
---
 drivers/staging/media/atomisp/i2c/ov5693/atomisp-ov5693.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/media/atomisp/i2c/ov5693/atomisp-ov5693.c b/drivers/staging/media/atomisp/i2c/ov5693/atomisp-ov5693.c
index e698b63d6cb7..a899e806dfcd 100644
--- a/drivers/staging/media/atomisp/i2c/ov5693/atomisp-ov5693.c
+++ b/drivers/staging/media/atomisp/i2c/ov5693/atomisp-ov5693.c
@@ -1714,6 +1714,8 @@ static int ov5693_detect(struct i2c_client *client)
 	}
 	ret = ov5693_read_reg(client, OV5693_8BIT,
 			      OV5693_SC_CMMN_CHIP_ID_L, &low);
+	if (ret)
+		return ret;
 	id = ((((u16)high) << 8) | (u16)low);
 
 	if (id != OV5693_ID) {
-- 
2.32.0

