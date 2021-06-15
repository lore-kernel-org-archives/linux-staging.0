Received: from mx-lax3-2.ucr.edu (mx-lax3-2.ucr.edu [169.235.156.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC3BE173
	for <linux-staging@lists.linux.dev>; Tue, 15 Jun 2021 18:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=ucr.edu; i=@ucr.edu; q=dns/txt; s=selector3;
  t=1623782819; x=1655318819;
  h=mime-version:from:date:message-id:subject:to;
  bh=VwHEffF6WEd8HZtGBpsh6YDP+gKybrkud0rCfHHpekU=;
  b=FhewwDOavk0pnxSuzEFHSIKgdyxi9vNtLqN7OQVoh371g2yQhwWXlPFa
   1ALAJNlh6RXH/1CE58tIGN9Xe8P3LGhQn2aUCkf2EtLO4b0YpTWcRlJ50
   ZoHYBMrjqELembzdcoxDAkiA69ReqVJ/awNLsMG3AH55ehL0FAAYx/UT2
   d+z/SjVBSu5wha6PvTo5qa0tuCTtT3LzvfplLXHuC2HcDmbrsi570db2H
   ft5cZBb3H/r3u1PDDmXzw53P1UcRN+zCUT7dDm/o+quC+6UFNkiOuQQgu
   2XthniPylOr2FXkLHl9aPUZDRIRIQQoW8gb3Q4RV6Roqr5LUU5fcd660Y
   g==;
IronPort-SDR: OwauJIIiMS/5/IpBHDZaGkPCbH0Jv2z1NWrfd8JvUYu7e3yszeSBWDWnot4gd/bsevc59ObAa5
 divlgwVFJFpACkt8n5+3Y/SLEIqQZ61O5LnNaTzc3hz3R7ijeLO6odvsMqDboCBqeEqBvGFXTi
 qSHo/bBBCiSTWvduunwQSJ2HSpEC3d5V+j5pSXEQxCQ70iW1oOg2hDDUdYv5nkx8qwRAtoSkQ3
 JkHc00NuUr9yud6ySDdOSsKrws2bQQoZa2rV4bInvWuBEaQV6bz+2z14R2jcaAlbdbzOkfo5L9
 qYA=
X-IPAS-Result: =?us-ascii?q?A2G2AgDC9Mhgf8XXVdFagQmBV4N4bIRIlScBmCWBfAIJA?=
 =?us-ascii?q?QEBD0EEAQGHOwIlNAkOAgQBAQEBAwIDAQEBAQUBAQYBAQEBAQEFBAEBAhABA?=
 =?us-ascii?q?W6FL0aCOCkBhAURBHgPAiYCJBIBBQEiARIihVecZIEEPYsyfzOBAYgnAQkNg?=
 =?us-ascii?q?WISfiqHCYJnhCGCKYFLgjd0hAuDUIJkBIMZexODdgEBAZ4znGABBgKDAxude?=
 =?us-ascii?q?CuUapB7AZVUpE0QI4ExghUzGiV/BmeBS1AZDp0NJC84AgYKAQEDCYcVgkcBA?=
 =?us-ascii?q?Q?=
IronPort-PHdr: A9a23:YMq7LBORB6ZfP9O1moQl6nZQChdPi9zP1u491JMrhvp0f7i5+Ny6Z
 QqDvKQr1wWWFtqAo9t/yMPu+5j6XmIB5ZvT+FsjS7drEyE/tMMNggY7C9SEA0CoZNTjbig9A
 dgQHAQ9pyLzPkdaAtvxaEPPqXOu8zESBg//NQ1oLejpB4Lelcu62/229pHJbQhEmjiwbbxwI
 Ri4sA7cqtQYjYx+J6gr1xDHuGFIe+NYxWNpIVKcgRPx7dqu8ZBg7ipdpesv+9ZPXqvmcas4S
 6dYDCk9PGAu+MLrrxjDQhCR6XYaT24bjwBHAwnB7BH9Q5fxri73vfdz1SWGIcH7S60/VC+85
 Kl3VhDnlCYHNyY48G7JjMxwkLlbqw+lqxBm3oLYfJ2ZOP94c6jAf90VWHBBU95eWCJBDI2yb
 JYBAfQdMutDs4nxu0EDoQeiCQWwBu7izCJDiH/s3a091uQsCQPJ3A0hHtIOrXTUq8j+O6QSU
 e+vzanD0DLObvNX2Df98ofIcwwtre2CUL9rbMre1VMvGxnbgVqNtIzoJjWY3fkCvGaH9eRvT
 /6vi3I5pAFrpDii3sYhh43Ui48LxF7K+zh0zZs1K9GmVUJ3f9qpHIZRui+VNYZ7Td0uTmB2t
 Cs+1rELt4K3cSoExpg6yRPSd/iKfoaO7xn+V+iROS91iGx5dL+7nRq/8kitxvfiWsWp0FtGt
 DdJn93Ou30Lyhfd8NKISuFn8UekwTuP0gfT5fxaLk0sjqrbLoIhwqY3lpoOrUTPBi/2l1vyj
 K+Rbkgk//Kn6+XjYrn/vp+cOJJ4hhjwMqgznsGyA/40MgcJX2ic9uS80KPs8VflT7VNi/06i
 qjZsJbEKsQHvqO1HRNZ34I55xu8DzqqysoUkWQHIV5fZR6Ki4rkN0nLIP/iDPe/h1qskC1sx
 /DDJrDgApTMLnjZn7fgYbpx90BRxREuzd9D/ZJYEK8OL+/uWkPprtzXEgc5MxCow+bgENh90
 oIeWWSSAq6WKa/SqkOI6fggI+mNYo8Vty3wK/wk5/71kX85gkURfa2o3ZsRdXC5Ee5qLFiHb
 nry0Z89FjIvtxckS6TBgUecWDpTYD6ZX6887ztzXIetDYrDT4qFg7Gb2iq/WJpMaTYCQlmPG
 G3pMYyFX+oXQCaTJNJx1D0CSbWlDYQm0FXmmxX3xPJENO3d+mg4vIj/0dFzr7ncjxw99jxcC
 8WbznGDSHxykmoURjgwmqdlrho5glWe2K5kxfVcGdFaz/xMWwY+c5XbyqgyD9H0RxKEe9qFS
 V+OXNqrG3cyQ8g3zttIZFxyX52mjxbez2+xH7YalrqELJg16b7HmXzwIdttjXrLyu1pi1ggX
 9sKNmC8gKN73xbcCpSPkEiDkauuM6MG033j7mCGmFuPrkFFV0ZCUazEFSQOdEvfrIyhvWvfR
 KXoBLg6ZFgSgfWeI7dHP4W6xW5NQ+3ubZGHOzrZpg==
IronPort-HdrOrdr: A9a23:0OJn6q1BlnOY9sHJ+Fg3OAqjBLskLtp133Aq2lEZdPU1SL3+qy
 nApoV56faZslYssRIb+OxoWpPwI080nKQdieIs1NyZLWzbUQWTXeVfBEjZrgEI2ReVygeQ78
 hdmmFFZLPNMWQ=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.83,276,1616482800"; 
   d="scan'208";a="48624317"
Received: from mail-pg1-f197.google.com ([209.85.215.197])
  by smtp-lax3-2.ucr.edu with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 15 Jun 2021 11:45:50 -0700
Received: by mail-pg1-f197.google.com with SMTP id u7-20020a6345470000b02902211e79e4c1so9351697pgk.18
        for <linux-staging@lists.linux.dev>; Tue, 15 Jun 2021 11:45:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=LSLEA8uny0SvK6BuP9EUGLzKH3cmbfNsLY8/jivrk4k=;
        b=uBDAXGitxwwoTQatPTqJczgt3+ib/bRrTvHVUKKX+cgx3x22+Gb10ZWcriZMPXvwqH
         OB2oxCEXb+NDScQDX/vV974jvU//pSVuxAJAlN8IG65/SfDRUrRsj9c9bOx9Fg8azoCU
         yHaNmfjbnpbrgAEIOOjwxcnihXIwDA7MtqN8Cy/q2HE+affXcyqLAc4139kNRcoDGan+
         JG3WySLUszy2UHbjkiQSsJx8U67FO20XKCmkU/591kSdZxZrmuFPgEL0lTbS50PqjWkp
         JaScjrL73AjmUAOhe68qEprK8EiOGg4PcUiMXMPY71qGpzwpvn2v9RKuderXEOhHOJvY
         fJHg==
X-Gm-Message-State: AOAM531uQWJwVvie4Js+oGIiZ5zYtk9JVjxPlcDXQYnvPldvRcAr6cqg
	5Ue7VMuh3HHmFQNE1tZTg/D/jZFPxRaNyuHG9eq0royD1BmzfqBVqzrPC6gqNYr8Tf3vc5pcZoj
	/Jcc5gFBA3Duhk5FwzGlFZupPuWdaxtLjwxEp1WAXpLk=
X-Received: by 2002:a05:6a00:a1e:b029:2e2:89d8:5c87 with SMTP id p30-20020a056a000a1eb02902e289d85c87mr5849456pfh.73.1623782748930;
        Tue, 15 Jun 2021 11:45:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzRMpzEEiW7csamoO9aph8EpArFwG28jZL6hWiXyGFAufQLqrWEPEkYySQa4vh+rPwD5JI28wk2KUtqd79gny0=
X-Received: by 2002:a05:6a00:a1e:b029:2e2:89d8:5c87 with SMTP id
 p30-20020a056a000a1eb02902e289d85c87mr5849431pfh.73.1623782748638; Tue, 15
 Jun 2021 11:45:48 -0700 (PDT)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Yizhuo Zhai <yzhai003@ucr.edu>
Date: Tue, 15 Jun 2021 11:45:38 -0700
Message-ID: <CABvMjLRkmsrxXxHkX7PrkoRK5m=7_b3wpvyZK88V19b05CFx2w@mail.gmail.com>
Subject: [PATCH] media: atomisp: fix the uninitialized use
To: Mauro Carvalho Chehab <mchehab@kernel.org>, akari.ailus@linux.intel.com, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, juant.aldea@gmail.com, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Inside function mt9m114_detect(), variable "retvalue" could
be uninitialized if mt9m114_read_reg() returns error, however, it
is used in the later if statement, which is potentially unsafe.

Signed-off-by: Yizhuo <yzhai003@ucr.edu>
---
 drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
b/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
index f5de81132177..8ddddb18ffbb 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
@@ -1534,12 +1534,15 @@ static int mt9m114_detect(struct
mt9m114_device *dev, struct i2c_client *client)
 {
        struct i2c_adapter *adapter = client->adapter;
        u32 retvalue;
+       int ret;

        if (!i2c_check_functionality(adapter, I2C_FUNC_I2C)) {
                dev_err(&client->dev, "%s: i2c error", __func__);
                return -ENODEV;
        }
-       mt9m114_read_reg(client, MISENSOR_16BIT, (u32)MT9M114_PID, &retvalue);
+       ret = mt9m114_read_reg(client, MISENSOR_16BIT,
(u32)MT9M114_PID, &retvalue);
+       if (ret)
+               return ret;
        dev->real_model_id = retvalue;

        if (retvalue != MT9M114_MOD_ID) {
-- 
2.17.1
