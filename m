Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26BF92ED149
	for <linux-staging@lists.linux.dev>; Fri, 11 Jul 2025 15:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752248457; cv=none; b=NmmtgZ1L9Kn7izoRJD88YIHaY96Y69cXsGzsr23UZVWSAMxZsFmumkefx0mWfJ4lbdAWZHbt3+RUiI+PtfTzT9EenQ+m6vQx6h4guvc4TR5x5rRUrRPoBGwbdNus3mkmuO5hytAzCTfxubi5WhYXfBykvJsQn5MPxgmhMt6jH6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752248457; c=relaxed/simple;
	bh=JSnDj1znwmL5xDOrPwpqc9Vs1vfH5VG24wDvIn/X7tw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WlVWad5Uspp0J1yJZ8Hvf/hGWE5vFbeAT0a+tQXsradWJW5lebkmpPvSKCONit2DmFki1xCCB0umaFi/Gs+l/OcIcYcMDU/giYEjyZHgMM+1vy4t+iDDygAQErMmuEmLSeTXG394MZcJ5RiIaM7Gg4MR+5Q8i8APOdPn11CbAtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=uC0HgoiM; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="uC0HgoiM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1752248447; x=1752853247; i=wahrenst@gmx.net;
	bh=DugjhXIO7Zc9X8QwSUhiZxaVIN8vHKh39CwZgNxvt38=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=uC0HgoiMinsMlKXO3hTTLtQCHYcdoAxEgAHSBeQMc+LSdqe94LfujMGK2gL0SYzJ
	 KXMhpyVGs1uFPkGPt7BVF0o93Oq9A1rrRZRVCm9Et/4XuY+O7Hqbnx2YBCe2H2Nc+
	 b5OZNLUumxEdKDU3gDFLhSk5RU0F5Keb3ds0J1eaaGivTMSM+K6HjqeHdbcW9lV/y
	 BppAjNtpwqOnYvRaaXsbQFvY57lfOoQ9wz/iN5x57NCVyurmeMMiNVmZiYqivkqIA
	 oy2Z9qwmpgl0OWnt/qiSOCMGtgbSttXTAwD+dTH4j+VNjqZXO+jXIKNQZE4HAW8Jj
	 q961IaHZMREfyYss8A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([91.41.216.208]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MOiHl-1uHtlA07wt-00N9Qa; Fri, 11
 Jul 2025 17:40:47 +0200
From: Stefan Wahren <wahrenst@gmx.net>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	bcm-kernel-feedback-list@broadcom.com,
	kernel-list@raspberrypi.com,
	linux-staging@lists.linux.dev,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH 3/3] staging: vchiq_arm: Make vchiq_shutdown never fail
Date: Fri, 11 Jul 2025 17:40:31 +0200
Message-Id: <20250711154031.24178-4-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250711154031.24178-1-wahrenst@gmx.net>
References: <20250711154031.24178-1-wahrenst@gmx.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:qnH3uwdiWrnDVmMtyeIsfdWkFyBvgD1wCIF8/eTUOOp0IEfR4dG
 /p1CM1BYZS7IWLxRaMzgFIPdGC+P5bi0606xpGCHu2KCGP9AoMJ/n6EMwzDXKOWHxPwiPcu
 oqfg31GcMeiX6qLUQEbLVELcpktycYRVShC8thofTSvdLAuDfzEtdZ3PnAbHXvTKuc0fXjk
 XJvVcjjVq2zxAirIDZsFQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:sYMrVtwd4/E=;AchiBApmOS6uN677szElt4j9Q8D
 omDK23cf8LqFGFSdMSGz/g0UWSNrx6vinmF/kD9JmHO19BQH6JZ6eUh9eTNmSX7p2cgycub1T
 YUufZoI+n7jsT7jHARHntN4B9bEofUDLnBWRhriGeHKEVQpJEovWDJfSuCap+b/wVPJJndoq5
 jAEX8MF3ByL+eznCjO7KrnR6DLzIQLup342/l6Sz2IALCKK3zQZ93XBt8V997pE2DKLTV+1b0
 TtphgyqYSnlQOk4DaTOQ8KpEBKmwdIEo9PSpsDQpeXuAtNie8o4xQFsrnNM7U7pQORp45Y4PM
 qGP/Yg77lWJu0ew5Y/hU+g72gfoLy+E4dqsWLzYPPDFZiuNSPt9Hu7qaEFksB6fV1mh9wcyBC
 xyzDBjLjW6hqFKrSMv1glLYmC7L674TdN+Vev7Q7F2OtAbciksTHAZC1QX+FQtixINJvhQ2Q7
 L7EFq72wrxv/wFX0Yw6YbJ13nvh3Cy1vPDo+ULmma3pB0+Fxc+/jxXOg3aUZW+zPrTCH3hl+H
 VcJruOq6m0tqRE8ZMNnPH+PSfuiIlEnBPNKtb5mmPLPcVrLFjmMyigP6U66V1aFxOfj5CvnSC
 98mh8/CdwtGF3gQ22zea+X83ULjBiVawAsSy/w27SmgsYVSXr4ZYkobp3H39bgS7uflph5jhf
 ZeMHmLNShK0LMOR73YBFRqiZryk0kxejxN/XWYPlMoiAe6ln7p42EKyzXVyaJ9PcN3gclgaum
 xssU6mGpqb/sngyBVQc5fK3ci7CDRO5VTxGuRdGqHdjYAXnGoZNkcocI05mWdtUQSbtCYndQQ
 GveSU5gytZPaaOFfpUp8j8sdRkxKTs4G9/eEaNiuo5mswfWAGFk4dmaiWNUrqB6arK9vFWIOz
 iwY9WXDy1VsHfFdlXatdp5cnn2b8+EV5Mo6ufuGpEAxKeEPHy27XDAhif5R4AXhzcjx1nKSF3
 E5W7h4LuDz0E2fbeoKFMgQxzBT8Ostq+m+y1v1E5zXoZI9v/HaU6ah0aEm5PyUu7vSeRP1cuT
 Xz+KZbh9U3sEcz8yFQSvl7YhwSc0dgi4GZT2pDgxaaa+URX9mTS5Rs3z5hacsmn/DKdsly6yh
 VSw4LfuMWgfVEp5q5YSo9WvfYZVkdpf7DstCN+YgtspG4p0tuD2R8aP2OjsbfdRNQJ1J6l/yl
 kQRAQcji0hQL1+HnMedN2OCMlgzbYTy4tAGme/Cq25TsmDDZx9QivWPpr9o24e5Vfy6lKI9tN
 vkHQDEv92pOcjKmf6s/p2P8xXUucZqu8lhLEkdyuXqd1mgz8+VRHeFhLROPHA8kh9cYOmTe2W
 2gLCc/0uPcUxYOjNtXXzpfUyF38W0a9mED+SuVVaNLqjJjpcMtDNbdNI5T/OHnaxKIzcqpv/w
 67mJfSzaL59xQ5frMYfv45yVDeDX4pXB69xPSH0iAh/oQqy0PTzaYvktsM/mPL/EKIEGJN1mD
 7yzdy10UiFVknK9BQwQ17DzRCkZE0pi75VwaphUvjoXZCUwY1puw+RJdOraexKC9j1TqChIG/
 yPsmuResV9GOtxhTHD4yI1gVT1eI2d+OgK/dHnvOJxcWlbrmQAGbjdyF0QCKM4ITDbTFiH2Qg
 oy6rtTQ/kJNW+P0piunHrYyCLL62L0yax0wrxRUQgQGJEVj9jprXtocs4BL6ahMZWryPgZQZQ
 7XD03gpDhDmSY4EEkQaTSA7APSEv5eUdm1RR1qjSKNuys/0K3Kb2bL/sQNN64NYd+e7jclmXZ
 b49IaSh06Sbk0hEUQCz+r2Y0E3iGBYkHyIfJA2YUtDG78qVwQ0IB0wOAL7ea1bwfHTIYQ9i7i
 0t1N3HvByjsNeg4axMB5XOqq++5cE5D/ScPFv0U5jfdiOjKWa296O9F15L+lEdwqtQg4SpL7i
 bjCSjGD8rrOcyhT3iEZTFmsbSavQMzKFp1RnonTvzCh3BnzSJtLK4nJiXgcGNoYQOucSJaMtK
 /SjbOOCtJfhLTDWnYXKhx4JybALqBoQiDoiN1sZcaTB0AKxb7DOu1fEwVfTOX8L7uSOnMdOr9
 UuGZjEbqmmVOLB2hfd8gE0eh4fpigUxnoMtJcbO1RW8xb18H+kVsW87Yq5PEarG2Rnm2RHbS5
 CyPeRaSro2EwVtw9n3WqzyZY7Jg/6UDau2su0Vl669YpwOODqhGGVVOgWmubl3ACcj8qvhDeq
 wI4JNPsBfFRlaI5BvbtK0xCvEeN45OCnBmhejwtRZp4/y/BmE3nDB8VHVv3Jt+ZqmH9itnH+5
 93xysQoF2ne+WLCGNwtNRvo5DDAA6m8R8WwbJfpD7cEfc4LD0+qokb1y4NY+1nf1pbfu4cq4S
 mdXyZb3XwP3kw4i1U+4l1Hm6w2nTaGlEGSSC1YuAThLhJ7NsAYMOy1DzqTrNuy4QLESCYBLXi
 q4f68Iw/blmBCfPo/fLnK9ZCpRcJq/y7WqElEHTepTzd5FHXwCuVXt7zpxjsWLCthSivHnFXM
 LWD3UKa4VrFKLcAsBjWnfClpPYPKBpDf4mPv5GiGrxruafmhVdzPbHSY0gv+0lAQKbD1UIJfW
 ht0FnJOU/aZg5j/wT5tOnK7HYtWKoGYkRGRnQt0O3gxlT6LbA/TYpsy99aopHP4K0CBR8T+Er
 xtStjqvKI9kZ3fjeij63y+bTP/TtNydOdS93hElaSECjjsgXARYKSg4H0jalucFp6eoUspJCm
 UFIhTjFBuX0nqM2VbDKSDSwNqBT3fVoD3kD3KP8V1bUoQC1J9/lQJlEQe1z3bAMOONZg9xei0
 fzuBdbiWCvp8scjocle3r8aHt9xho/kWlLtdxCbQxQ8KuX5Oo8YSgPHVQ/bALFDKCrXy+932O
 fUTVbrdPDDa5aWMJl7vIjIIx60uMKNmjTBoY+vucJ0QsiXJnirUh66knFaF9R467PQpZWQeuJ
 5Npv4aWQO5mPOyljVR3yg3EQPPE2wY7DM7ts8NyEaSrLxGqdtFmKRukz94gSg/V8PPLx275BZ
 f00BapWW8vGPJgEV2lUV3nctDl9bRlsTTM/LdP+F0EDvP21rsU+6rQdYmxl7jP1BEqAcDvVkk
 tMpBeJ2LSW38TtWgjXCOe8tecPldfmayRPlIFRkuABFhBJuZTqZaJxfR1skf2ouMzdcmwPFOu
 CQvWh03g9RWJGUMZbSRt3DOxBl1NePuF39lXf5dD76gVSg7r1gE8tLJ4ypHm3ofd2xfMaa0Ly
 MaRUqa8eoGZi3ui+EbwdpDf/W6hIRoloKv/dSnoupKOx678LvgWkn8tmajHbXi1UH2ceWsTW9
 +v+asOjXseEqzDhuGRK009HsP7Yzm5YY7BCGjSvpckvJEyAI7dJr7rVOtCdA4cJlEIROqo5Jl
 reYmuvVywYq/QiS1YAMc77T+9w70tksuh4NGaYnzFuVKY1nCVy9bOuXBeeHnJSSPXmTWXslqC
 6IwLh9uRwP1cOIYyY9fdeWd3p7oV+GvkO7a+gbxu7fKnEqHm3fC4jREH6SBKX0PchWE6Tg0L9
 psw+f/5w0tszhgCc+4sWXUpPrgKG1KBmhfya+mRLD+FPVVhrhUA30fe6+8e7Z/Yh1FycJEqTh
 0H3Rg67fSCzzyaXOjKdN8T97fjz4YJNoZ0BHm2oBghuomlXsTDEagwyoDkFSPFnK+Q==

Most of the users of vchiq_shutdown ignore the return value,
which is bad because this could lead to resource leaks.
So instead of changing all calls to vchiq_shutdown, it's easier
to make vchiq_shutdown never fail.

Fixes: 71bad7f08641 ("staging: add bcm2708 vchiq driver")
Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c=
 b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index 6434cbdc1a6e..721b15b7e13b 100644
=2D-- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -393,8 +393,7 @@ int vchiq_shutdown(struct vchiq_instance *instance)
 	struct vchiq_state *state =3D instance->state;
 	int ret =3D 0;
=20
-	if (mutex_lock_killable(&state->mutex))
-		return -EAGAIN;
+	mutex_lock(&state->mutex);
=20
 	/* Remove all services */
 	vchiq_shutdown_internal(state, instance);
=2D-=20
2.34.1

