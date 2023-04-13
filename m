Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DA8BBA36
	for <linux-staging@lists.linux.dev>; Thu, 13 Apr 2023 20:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
	t=1681417561; i=markus.elfring@web.de;
	bh=E0mXNV18qxwFw4wpLkiA8jyeLw0uAf7GW3H0TvcZAHc=;
	h=X-UI-Sender-Class:Date:Subject:From:To:References:Cc:In-Reply-To;
	b=N+bH02hSc+NNBSsYJ4qsh2IUEqdTPlrokvbjIbIy8/ENHht6Ra4MqgCjTUcqihs7f
	 AvSyS6v68yx3JJ0ckm3hpvqevQK84iCiC1Y70VSy0qsjBv6/3gTvuWa95LCBjssnN+
	 I6RZ2yI+mZdiwJOs4+RztVxq3IXzVyXiDeNMG7f+m8i1bvjLzkVXblY8rr45GuW3rT
	 sxKvMDplI1ykXrIa/XoDnlDN/Yedw+ZTAZfZ4id560qmgJ/suaHwIf4517BEicfDsR
	 kuxJut0OoCiIMC88L3qE1KtiQikk5LXIQM0brsA6oOMv5zGhWw7X4emFxde5l9VEhm
	 nmWL07AjO777g==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.83]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MI3p7-1pblIs3TzL-00ErDf; Thu, 13
 Apr 2023 22:20:17 +0200
Message-ID: <d8ed4e5d-49d4-ca7e-1283-1ec166bf643d@web.de>
Date: Thu, 13 Apr 2023 22:20:15 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: [PATCH] media: atomisp: Move a variable assignment behind a null
 pointer check in atomisp_cp_general_isp_parameters()
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
To: kernel-janitors@vger.kernel.org, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev, Andy Shevchenko <andy@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hans de Goede <hdegoede@redhat.com>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Xiaomeng Tong <xiam0nd.tong@gmail.com>
References: <40c60719-4bfe-b1a4-ead7-724b84637f55@web.de>
 <1a11455f-ab57-dce0-1677-6beb8492a257@web.de>
Cc: cocci@inria.fr, LKML <linux-kernel@vger.kernel.org>
In-Reply-To: <1a11455f-ab57-dce0-1677-6beb8492a257@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Kc4GVntHKdnb1UAYA6Irt+uVFidshrQqzT4A3EW+7hNpqnvtCMi
 astMuaz4BUzEuBIfDboWfaS22JnJ+fUUk0OQhV4H/I6PSKfQn2NJzO5my+klSMtGNA9+Nk4
 irHZTP0GFzvyQdurj0fZVA3lJCyf1bdvHGr6E3S3+w5R46TDyLOk4WjtaEvtljTE4o+9X/R
 tbiU4r28adfJqcnpHTvNg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:9aTo2VfwJ0c=;/CyD8gL43TFxuZg08kgiWb11hWK
 Jh6K23DpiGVK1CTy3wGRXshREjcYgPCQ0Xk3ytWbrko37wSh08yp3oILx6LOiL6Bc8cGqYB8J
 adGo5ug/n1/YeXxtgIt0O944/fGYMHeATh8zrHuAm0z0HKxFWG+1Jw9fTVK61kXvbS+rCtnRQ
 BzTlKUtx7rlbDuhqJlu09ngjYP1YUN2uJB6KLlFCzeAImH1uBn4QnexJPYOVEWs+xBkx4bB7e
 97udLJFJ5vUcSrWOznnhA4/XH7FeugGlOxTjPUbeD5STzL/b6smmFoL/WEfRvfT4TxyasaK4H
 PUMyo3MOPZL4vN+tm8Uo5+bJbs10rgGOXBg4z9HUxGD6kn8yZEkvU83DsOjojrR6EtKVFo2NH
 lRtQdnb/YV7PIJDTf5SbgOUw2SWxgIxtBo+skNpc2DRwwL/fRt4+vr/F6BjHtWFpPxNv34lV2
 E3wuk6nEj+6vcj9VxrGW+wCQnkZOdyInBGxc8/valfk+Z/LGrvqZWyjcgxs2UHfDjlytnvlSv
 kYs7WboIDXrauzs3Y6NLwGJIxDDQS8Yh234GRSMmruIzbWLxtcAkyK3OcR8IjTrjU/szXTylu
 2GzPfrDWmfTtSDAMJYf+NImAwNUBtzPvax0pf/rFxl+VMTFQIHMH6A+KckOY5inyvyPE1mZiM
 mS3vQVn9DKmfMgsqZLZMRL2XTF3g+mMWoaW4nDoEe9kb1ttv0C1MOPPFOiHRtcGah/9dDW7Cl
 fd18ZfDwAG8RrWcZMy9TZlZc8ODezksevUAtLNxFtWCUVG1Oo3iX9HXe3wPvndSC8CE4Y390/
 VzaYvOZf/7TVyYZHOIx5UA5ZM0B9mqZkuVGtxf3OPliiYXCgsxqSX7K2/1FGW0U+UjrTIDXud
 XKGmXfRFxjEskmIZHy/CIXdcLrOlExgcYtz7/9xiU8A/2hWQrJ7y4PS5b

Date: Thu, 13 Apr 2023 22:08:42 +0200

The address of a data structure member was determined before
a corresponding null pointer check in the implementation of
the function =E2=80=9Catomisp_cp_general_isp_parameters=E2=80=9D.

Thus avoid the risk for undefined behaviour by moving the assignment
for the variable =E2=80=9Ccur_config=E2=80=9D behind the null pointer chec=
k.

This issue was detected by using the Coccinelle software.

Fixes: ad85094b293e40e7a2f831b0311a389d952ebd5e ("Revert 'media: staging: =
atomisp: Remove driver'")
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/staging/media/atomisp/pci/atomisp_cmd.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/sta=
ging/media/atomisp/pci/atomisp_cmd.c
index 47f18ac5e40e..733a239b5d8a 100644
=2D-- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -2723,11 +2723,13 @@ int atomisp_cp_general_isp_parameters(struct atomi=
sp_sub_device *asd,
 				      struct atomisp_css_params *css_param,
 				      bool from_user)
 {
-	struct atomisp_parameters *cur_config =3D &css_param->update_flag;
+	struct atomisp_parameters *cur_config;

 	if (!arg || !asd || !css_param)
 		return -EINVAL;

+	cur_config =3D &css_param->update_flag;
+
 	if (arg->wb_config && (from_user || !cur_config->wb_config)) {
 		if (copy_from_compatible(&css_param->wb_config, arg->wb_config,
 					 sizeof(struct ia_css_wb_config),
=2D-
2.40.0

