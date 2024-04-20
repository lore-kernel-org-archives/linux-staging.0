Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 638F626AC5
	for <linux-staging@lists.linux.dev>; Sat, 20 Apr 2024 11:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713614062; cv=none; b=NYSIhoGC71mHXbo9w8j/FH4WY9wlckS/egPSsfDhVkB/mmph/vmg/ZMD3vGpPd2j1ahgETwdEUm58XLkAM8KB5Cz/h/eh0s/EZs9oBg77mxMyy+dWbCVluTbkFiPk4kjuqchPdin+6skp6r56SLmGo3WtV/LJPbwvAqW77Bzh60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713614062; c=relaxed/simple;
	bh=27SqZgiR0UUNKZ7sL091LOzB4R24gF1/J/jg7X9upik=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dakKe33GB/oSDGlNkDZepYU2H815bpnvkWxvssAyOR9hwRFwwVrFDUI0oBSQQT3npTzA0JsqS873GqVxzeOkqI8bj4v11MmlM8Qb40aRlvhK6Vp6CaK7PnnqRcaM7UAOrbMrCLiTDLqvRK6UvTEElF3s69wQZatS8mfz5YDhTcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=sOlUYjhl; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="sOlUYjhl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1713614049; x=1714218849; i=wahrenst@gmx.net;
	bh=XBz6vLDOKmPiyoGHSaBiqOwfqoSTVC8G8FHmgrlgS+s=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=sOlUYjhlB1Qo2orodh1n2/0CKwbhRN1gECha9OLRvsqGsfxKugsBTbEsgsLmymrq
	 oySD17jd5oIQT0q8ZzTo4g9+GwobDB6jNADRstjecQJl/7rIDNqEVWYKoKAQnIURB
	 5HjvClTKw1kSxC1/Oka7gKkgDi2geiJJjIYiQ8L8+Z+w6yKgoGo29JlrufwiZXpSO
	 RHZnS0/0pqlpwq7wK8AJPA3Mtk5kfwTe3768xTlzx1gIZI8Kp0f6Y6AtUQpZr641q
	 fA7yrB1miI7RzY11zwero4JD18WCsXvb8lTZagRKWJ3AibiSOHrKySWxYtFOUNhH4
	 iUbHcDZuHDqij9+cfw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N6siz-1smvMc2wbn-018MGy; Sat, 20
 Apr 2024 13:54:09 +0200
From: Stefan Wahren <wahrenst@gmx.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Umang Jain <umang.jain@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH 4/4] staging: vchiq_core: Add missing blank lines
Date: Sat, 20 Apr 2024 13:53:51 +0200
Message-Id: <20240420115351.27713-5-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240420115351.27713-1-wahrenst@gmx.net>
References: <20240420115351.27713-1-wahrenst@gmx.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:UciPNtNmNbb/tnBiK7doL+w+C3Illm4dS3sRX1UkFtoouuJtCNp
 KFRX+2L50PpIGA5QtaxvBrR7uw7hVT6vriyarXn4wDRV1NBT0ZgtIkEPlACJvxxDBotrnAF
 1gwAx+DrgNEO2gzJ+XWujLAulckWjQ4GOWs3hDZT+/s2rfVLNnpeAr2FTgHMti8VQU8wh7b
 4h5UFLFfqjArJ5cLE3Org==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:jbuVK7QtgZU=;vRu3sJclAy02O9V9zAaz748T8zY
 HphDShhpRk6s5+jLpCETYrMIQEVvhJ6vt9MaBCr0YUOP/TQzfemHS+c+TPL/vaOWx0Wzx9Kye
 6Vshb4YWODldECMdmGkqLENLoB0yXB2uPXh1m0zaNacZsM9cZ4/9/FtcQnpF0QSWhb3MOUjAj
 6RgRX+caSEdCGmNPYVxg0QZo+zq/RUcDgGfh0aFwLWJxb8EMW3xwgx+IIk1NypgqomfYcFilw
 ZfBkGuOQbv5hEI0OdArEd8Of3loI4cWRnlni+2RwaNYTFqFD5nZIOARwlS5aluuk51MbRoiAA
 3XxVf1re3hbr6EMXT3awPeJMVNYuSGOazs8eSfINzp40jIBMvb4KfWDySFsXRZGN2iBH0mGlX
 wYIvpuwpfkC/IRFn7TKVITI5G0w5W3+0W99JSq6/1rniiRj2lr0LI0OgEw2JQiOf0MvKasnhc
 cN9WU76EeJLTU5VDoy5yLyXviU/E0WS5dKMNzuFDXbVz3dru+IeLpwoCKXND+F/ZIEmlvfuly
 U/0ajkVKZX1gY0vkfflSjPHmOdr1xZYOQ2rhJlUbr4yeilSkLXLbT2zBdKF514TstjJnfeb2N
 b7qq2YrMyNLA8ha5PiwO5RFs6QQdEZ1YDrlVnZZTfSlOwgTy7ENZqhanrrqeKKqoA4SroX6LT
 /0fODogBL8GDLOLP+GTweC7yAEloKIhfja/G2qpl6S7jnGCX59oZgYI3Sc9H+UtuzXAPvSvdr
 k18SikKIZ7hdUDheYUboX9lEzocIYCU002VnkbZD6ivk+LRhsI8vO5yBeKm4C7yix+JGLLscD
 z5mdyi2+xgYAtHl8cYTu65f26II7Yc/U9WI1HFOubXXhs=

checkpatch.pl noticed about missing blank line after 2 declarations.
So add them for better readability.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.=
c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index ca32902afe06..df3af821f218 100644
=2D-- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -227,6 +227,7 @@ struct vchiq_service *handle_to_service(struct vchiq_i=
nstance *instance, unsigne

 	return rcu_dereference(instance->state->services[idx]);
 }
+
 struct vchiq_service *
 find_service_by_handle(struct vchiq_instance *instance, unsigned int hand=
le)
 {
@@ -2176,6 +2177,7 @@ vchiq_init_state(struct vchiq_state *state, struct v=
chiq_slot_zero *slot_zero, s

 	for (i =3D 0; i < VCHIQ_MAX_SERVICES; i++) {
 		struct vchiq_service_quota *quota =3D &state->service_quotas[i];
+
 		init_completion(&quota->quota_event);
 	}

=2D-
2.34.1

