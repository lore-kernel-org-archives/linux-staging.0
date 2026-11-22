Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.23
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795387854;
	b=u4Wil+zXCjINVYRP8R5MquTv4gFeGxvGg4fTA3EdkPNjZudi0/J/m+aCcRzP/wFOyUVN
	 0Vbs2Bcuhw0/vXQwnBpGnhrHfGMT0OMjUaO5DimsC3YrX2tm6fXH3nLnyhiqF3H7sbQoK
	 Sfn16WjyMMELbxCGWv2BQL7IHxm5A6SoYkIlDAXsblYONNqQu3OrX0EjVlnWam1kCJDMa
	 AFb9Vgu90n901w82eWCn/SN/hucDGIIPuWVJkTHAA9gRJCjfrroPbC1xgdJrtMi8fsa6N
	 luxfXIiDVOm75aRlf71HvUCBPMc470le/6XOuIYgnvC/5HsBl7DR+qnP5qXPsE19xtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795387854;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=iJm2GNroKLV2zzxKVlxwUbd/xJEtVbqINCOj6OUMXgQ=;
	b=HP0X/KED1INHSWZTfN7xNhqtfZ6VQKCJKoVzgQ5D5/PEC4U96GuTIFhFwAX933dY3XHM
	 K20BZdkox52VX/Z7+c8vGA8op2Gm2i2DGechjVpB+mY2RCGdV0Ch9wVaoMNr8eROlF46n
	 IRLeKAnILpSURPsLcwQ5TGVKdWvBhYhAfhXQsM9XzX4MK8iTNHuU59m3ZnOy5t4HIdPTw
	 2VEbzvVtFX2p0RBbTKR4kcWmEOxD9RL4ZI23zP0stfr819GiWh1yVzq6KV91Q/dUhKi8F
	 ewOtzfkuZ3Ogp8mxPMFeoziYn3NqGFUAO/Np0eLfnNfduFB4ir2aaa1sSjzMDj5redg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=innora.ai;
	spf=pass smtp.mailfrom=innora.ai;
	dkim=pass header.d=innora.ai header.i=@innora.ai header.a=rsa-sha256 header.s=protonmail3 header.b=JnTnYF3F;
	arc=none smtp.remote-ip=185.70.43.23
Received: from mail-4323.protonmail.ch (mail-4323.protonmail.ch [185.70.43.23])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39E90606A69A
	for <linux-staging@lists.linux.dev>; Sun, 22 Nov 2026 22:50:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39E90606A69A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=innora.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=innora.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=innora.ai header.i=@innora.ai header.a=rsa-sha256 header.s=protonmail3 header.b=JnTnYF3F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=innora.ai;
	s=protonmail3; t=1795387852; x=1795647052;
	bh=iJm2GNroKLV2zzxKVlxwUbd/xJEtVbqINCOj6OUMXgQ=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=JnTnYF3Fsy2LA3VpPO09KPsIMXS+Ko/4jyydR+WsrsBIjx7v2iFUEgTN/m0YzhJgk
	 8xzvXES/eUeU5sigpwiJQI6x2at064nPq9+utKKzt7AFUsUf15cpl1NUqrf4wibfeV
	 cXZ5Gx0LKZiGEjqjdTsYAxr7kbDkhh6Nb3XgN9GA00fOonVm3O0+FjY7YdCGT/ZLKf
	 99WvZhXRgfni6ujVDnT6rJauyEEWU2RgClwW9FNNLtxl00GfACfkZeAAuyhznrwuFM
	 yWR0OxO18s3U0IyWGsnb5oSrePV2OUg1V8oS5eCRO6QdBWPxcURUT/yQy+018jUk1J
	 wQvCssfdNJa3g==
Date: Sun, 22 Nov 2026 22:50:45 +0000
To: linux-media@vger.kernel.org
From: Feng Ning <feng@innora.ai>
Cc: linux-staging@lists.linux.dev, sakari.ailus@linux.intel.com, hansg@kernel.org
Subject: [PATCH] staging: media: atomisp: validate DVS 6-axis config dimensions
Message-ID: <0c2Zqei57CqmMI6Dh34hKZdsp1D1ar1jHsyfzY4owI-GIAu-jshsaBCptOXe6b81ZwQ39udm6hHTgalp23YhtChJnYEuYu4pW5oPsu42acA=@innora.ai>
Feedback-ID: 140578448:user:proton
X-Pm-Message-ID: cd2e366804931e694787fe72d5606c49664f5264
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

The atomisp driver allocates the DVS 6-axis coordinate buffers using the
stream geometry, but copies from userspace using the dimensions supplied
in the ioctl argument.  If the user-supplied dimensions are larger than
the stream geometry, copy_from_compatible() writes past the end of the
allocated buffer.

Validate that the user-supplied dimensions match the allocated table
before copying.

Note on commit d178c7ca8fef ("staging: media: atomisp: use array3_size()
for overflow-safe allocation"): that commit fixed the multiplication
wrap in these same allocations.  It does not change which dimensions are
used for the copy, so the two issues are independent.

Signed-off-by: Feng Ning <feng@innora.ai>
---
diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/stag=
ing/media/atomisp/pci/atomisp_cmd.c
index e66a7d1c7..ab7cbbb8f 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -2637,6 +2637,16 @@ int atomisp_cp_dvs_6axis_config(struct atomisp_sub_d=
evice *asd,
 =09=09=09=09return -ENOMEM;
 =09=09}
=20
+=09=09if (t_6axis_config.width_y !=3D dvs_6axis_config->width_y ||
+=09=09    t_6axis_config.height_y !=3D dvs_6axis_config->height_y ||
+=09=09    t_6axis_config.width_uv !=3D dvs_6axis_config->width_uv ||
+=09=09    t_6axis_config.height_uv !=3D dvs_6axis_config->height_uv) {
+=09=09=09dev_err_ratelimited(asd->isp->dev, "invalid DVS 6-axis table dime=
nsions\n");
+=09=09=09if (dvs_6axis_config !=3D css_param->dvs_6axis)
+=09=09=09=09ia_css_dvs2_6axis_config_free(dvs_6axis_config);
+=09=09=09return -EINVAL;
+=09=09}
+
 =09=09dvs_6axis_config->exp_id =3D t_6axis_config.exp_id;
=20
 =09=09if (copy_from_compatible(dvs_6axis_config->xcoords_y,
@@ -2689,6 +2699,16 @@ int atomisp_cp_dvs_6axis_config(struct atomisp_sub_d=
evice *asd,
 =09=09=09}
 =09=09}
=20
+=09=09if (source_6axis_config->width_y !=3D dvs_6axis_config->width_y ||
+=09=09    source_6axis_config->height_y !=3D dvs_6axis_config->height_y ||
+=09=09    source_6axis_config->width_uv !=3D dvs_6axis_config->width_uv ||
+=09=09    source_6axis_config->height_uv !=3D dvs_6axis_config->height_uv)=
 {
+=09=09=09dev_err_ratelimited(asd->isp->dev, "invalid DVS 6-axis table dime=
nsions\n");
+=09=09=09if (dvs_6axis_config !=3D css_param->dvs_6axis)
+=09=09=09=09ia_css_dvs2_6axis_config_free(dvs_6axis_config);
+=09=09=09return -EINVAL;
+=09=09}
+
 =09=09dvs_6axis_config->exp_id =3D source_6axis_config->exp_id;
=20
 =09=09if (copy_from_compatible(dvs_6axis_config->xcoords_y,

