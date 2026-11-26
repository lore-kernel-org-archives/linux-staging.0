Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795657001;
	b=Wm3X9APqnUxXvRTIsXn/jSuI+UzebEt5OculQTISYgrQrDHGE6LvzYOBgIhd57s1Bv23
	 uvvayI+bkIzdvFMA9tODL/wjHEQn4jyufOPKMVgX+4eQW21xQzdengdeV+MrMvi8TxUDO
	 N0e8LW02poz/JKiYqsFocL7h3hVU9yA0ZsqRmKHOqxRQUaOQL94eAr/+4TKNghvkN1jW6
	 4GaIxU70TQIdsYaCXZqH+GAZ14xutnTYF3p6Z2HkgZ8bCIy9DH312LrBpRFkBjn0D2yOw
	 q+hsxmN1B46cCy8SUm8a23cwJM8sUzvjG0jT2hCgTXC3wbCsX990ol/Cpsv3uE3gNwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795657001;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=DpPR4Lgudy4Xn24waxb/0v4e1jw2nsNC4nh9F+XHgf4=;
	b=OR+OjwOdGhq7SpmNIvK8Ood6Wg383xHRy3haZ6H1EuZRn/UQvvrxtQfQHZRtGyI/rt7p
	 YC/pMnPVwwsI82kt5YKOtvkalNucOiOpheMbTM9KoYmaoOIRcrF1e4WA8+R3YZLzFLs+3
	 Qovbs0cNBId3mo1jZ4WEDmgDQDl4+MRHZHDeLwJny1nXx1NUG8JbnqkeNSg7LjXee6W71
	 3K79wkWY8Qg9ECfxBbRTqeB84iEoWIdTccnAEbJfdrA3HUUJLRhloDwko6DLiQtBw9wjw
	 CfTR7YorfgFBVgMK6ahMOWHnnyDxsZDbLeGF5N9aWccIZMKTk9FysCCmN54tEb/Qrlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=innora.ai;
	spf=pass smtp.mailfrom=innora.ai;
	dkim=pass header.d=innora.ai header.i=@innora.ai header.a=rsa-sha256 header.s=protonmail3 header.b=je4hLDKD;
	arc=none smtp.remote-ip=185.70.43.17
Received: from mail-4317.protonmail.ch (mail-4317.protonmail.ch [185.70.43.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC9C4606A321
	for <linux-staging@lists.linux.dev>; Thu, 26 Nov 2026 01:36:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC9C4606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=innora.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=innora.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=innora.ai header.i=@innora.ai header.a=rsa-sha256 header.s=protonmail3 header.b=je4hLDKD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=innora.ai;
	s=protonmail3; t=1795656997; x=1795916197;
	bh=DpPR4Lgudy4Xn24waxb/0v4e1jw2nsNC4nh9F+XHgf4=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=je4hLDKDtTJ7UfwAh5rXTWOykyeXGhmvrV6vgCexebLRz+SvVCCd/K88omVptlSEv
	 WTkCUte3O8B22JCEm8UURGXraRq2/QmSVcJ4iDarsiIi49gtjOqCoMy9qIuWOo3S01
	 Zd0i6F8vHIcRA/s6qh0I/3ikjI/i6fksBBs5Y4U3wf6D49uXseLE9PlWBFaB2y80B/
	 Hbhq6x4VH6u/nwgzwSW2uG5UpIEFJRnebToRyNen40ASCorFiHTLzX0PFfvTIpL/l/
	 3amIj2k84AvEVtiXF/l1iMej6mahU84Us8h4HE67x3/qCcu/TVgMXu3JOLtcfUJvt4
	 0eDyf+4L8OB3w==
Date: Thu, 26 Nov 2026 01:36:34 +0000
To: linux-media@vger.kernel.org
From: Feng Ning <feng@innora.ai>
Cc: linux-staging@lists.linux.dev, Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] staging: media: atomisp: don't free the current DVS 6-axis table on error
Message-ID: <20261126013631.53654-1-feng@innora.ai>
Feedback-ID: 140578448:user:proton
X-Pm-Message-ID: 18dac58aad0ed82082464985013203f839a7f7a0
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

When the new DVS 6-axis config has the same dimensions as the current
one, atomisp_cp_dvs_6axis_config() reuses css_param->dvs_6axis instead
of allocating a new table.  If one of the following copies fails, the
error path frees that table while css_param->dvs_6axis still points to
it.

atomisp_set_parameters() handles the error by calling
atomisp_free_css_parameters() on the same css_param, which frees
css_param->dvs_6axis a second time.

Only free the table on error if it was allocated by this call, and
leave the current table to its owner.

Fixes: ad85094b293e ("Revert "media: staging: atomisp: Remove driver"")
Signed-off-by: Feng Ning <feng@innora.ai>
---
 drivers/staging/media/atomisp/pci/atomisp_cmd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/stag=
ing/media/atomisp/pci/atomisp_cmd.c
index e66a7d1..afc7dc5 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -2718,7 +2718,7 @@ int atomisp_cp_dvs_6axis_config(struct atomisp_sub_de=
vice *asd,
 =09return 0;
=20
 error:
-=09if (dvs_6axis_config)
+=09if (dvs_6axis_config && dvs_6axis_config !=3D css_param->dvs_6axis)
 =09=09ia_css_dvs2_6axis_config_free(dvs_6axis_config);
 =09return ret;
 }
--=20
2.55.0


