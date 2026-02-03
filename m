Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 208443D1CB7
	for <linux-staging@lists.linux.dev>; Tue,  3 Feb 2026 16:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770135520; cv=pass; b=o/8+ZemDu8FBlH/KBB4aC/ZG/vG298UDN1iKoJnrSibBrKJ3Fmr5w9zwE+1/7XnODlNx/zetRCsFodzcpkx4Cqpk4rhBEdCsx4XQdPl01hG3iW05SSLLX14yesTVrJIeYTKTsIYG5xl2IZANeb05D0m1xl+LW9SUbg3wssuVgLU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770135520; c=relaxed/simple;
	bh=FvpXcFFSb2M8A4on9PoldX7Umk062cu4tEfx1+sP0L4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=UDZ1+BvlAuLL7FBbtS2SzeJ/h/Vo0YPe84Don0byK1VJ+hnAaWMBvltQdcIJ27Qr9I5ycDvd200Ykz+vtfNUUZB/M7yYgxbU+tnGkg1WwxtYBrx4u7k6coPy1iiBvsnogUpwDFPXLgjGSsdVZ1Ht4ALKss5Zb6AIPrWUC16dNCo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HKni3WJ9; arc=pass smtp.client-ip=209.85.161.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HKni3WJ9"
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-662f30d3f1fso577841eaf.1
        for <linux-staging@lists.linux.dev>; Tue, 03 Feb 2026 08:18:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770135518; cv=none;
        d=google.com; s=arc-20240605;
        b=TI59fiWZs93TPoOcp5VXbK7RzTdMAKJo4dQS3AzOaGHi0/cQJQZ0Kvu2wu9R1dCMKf
         qM+k49TWOLLvGQX8QesEAUwdbTDbLIdB8JxM172tfl0i/3wluRG70kAmim4cwF87PJTh
         IL73vLeDLb5xSVFCdrnM8b6iOjNdWQ7zKCbRGhIf9fsoUJi5DSCGr/XcVFFpcYGPeQCj
         5smXoVQT0ZtNs6YHnS4ZKdahf89v0ygCMMJI7wtAaJc4agzRH1rvjRPBhjUSUvkfGPw2
         0Hzx6yISgXIRI87LezlL5RMod6UbKcxMoGGZZsEzXdRhBgi++keShBi7uNuDhHvI2/88
         wD+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xm4bQH/8DfH5oBJLrXQ3JxWXAn2eurAWgkNAD5zuOH4=;
        fh=t/D2qtzTwEw4UYzYhTr0WORhiWkG2sCqaTuE7+d5iTk=;
        b=VnHGEWSZ+AWbcIoABmhoWRJGFpapKgnYMMqkwam9Em45bn7gv44GQcKHqYb6QY26xR
         opHQOyP2A1ngm81sokyfS+2jslryO873HtByaAr86xJkheq3yvZzN4tYKZTaP04Fym0I
         tkLIEpyV4dnb+mpoWub/9JNg591dF3yE1eoCmb8vOa4ZqSs4FMlAQoVUD7ZpazfA3L+P
         p8JOQjse21RricrufZu3seVpN15Nf3yTj/P7SPKIZcAq2y7ol963pvLvN54v7MQKZhdX
         L7hggIrm7p+1u4TNqZEpUaKwJ6Mz0tH584TE6b2Ce3LmZLYEAKryeXVtaPsjogQEpkIT
         ddDg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770135518; x=1770740318; darn=lists.linux.dev;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xm4bQH/8DfH5oBJLrXQ3JxWXAn2eurAWgkNAD5zuOH4=;
        b=HKni3WJ9YkLz87dfXrvw7Vvlx7EiyqSXY2re3BdeBPF8jT+i/qGH2M+VlSWtEKLimy
         I+01kQyEiHDlLSo26L+tsnx6vaVAKBju2A6ZOg42FDFAZGKnHf1bpREDaoqLA2wtKi34
         UstUqP6BHMmBtUcEBvh7W2qNqJbUUbqUT7ypTM3AWfXxDUhCMbGm2nzi1A48Ll2OsMSM
         +cu0KzDNVMKxI5EiKMjLMzkV830QurtErXx8i9iiAj4aekOo+LeznTFZJezf/tEvdPBc
         YReHExVOONlsnqO2uZfcVuAHJOz+qPPNPHFgGqFRONZG53jSrATcatGPlen4m0UWdecG
         Zg2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770135518; x=1770740318;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xm4bQH/8DfH5oBJLrXQ3JxWXAn2eurAWgkNAD5zuOH4=;
        b=nhKA9vUijRve2p8mZSNFReP+pVXrY3vq+eTA5UKF/kdWLBZTTvZWePXR87ilQl2Qnf
         xqxLUHvJMu7HJO0R1WjDEblnPGLZw1FEL85ATpEaTLOOfgAFEYUKPrlm6IHl3UD7niOP
         1WYyQs1NqxY9cnvJHoh392eETCUfbNctplxvQ/FntyXaQXHXURKbBzZPxuErwg9ixsuR
         oGWqfgNmfFtEA0Eq0aRn1CFOu/DPyl8vE5oXGz12l4iHrjwRgTMMKC1QGFH/gomodtWC
         ooqBC7CTWBjAm/0H/k/SL+B9twQcQm7Z3/caFIGmOR2fZM9EYYLav3dzyVfgs5W51SDR
         u1PQ==
X-Forwarded-Encrypted: i=1; AJvYcCVsOrZWpkdHwQxXvIScApfCexcIPLDYHInRAT1ydahaxQfUnBFcehwTVlJHjcmJALuAqVIe5NH4lgZ7YiXr@lists.linux.dev
X-Gm-Message-State: AOJu0YzpbYtppqYAb+wchecPlv/6Taap8JbRcFMjtQE+QreAyPtVY2KB
	3Og8JZv1vsHmf3fGu8uJ0mAxacmvqVyoZDezuEVUpcsnTjQN0pXWOH0wDquxGLI+zh26w44iqyH
	+OXbmlOY6Zq2hmgxhXrk9hmQuWK8qJwo=
X-Gm-Gg: AZuq6aKSitNrNRPyJk0fhVNP0yCOk3vl4W9CDgpX6x+6w6gFe3NQ3oTvUbsOw+wuk4E
	tVdAylg3Vp52rAH8MudD/8i/q63vOux/BQ1/GEXqLohqB7NToBNvTAofCBEZlOKK/t9hzZlDhmr
	ymT4/fr9BbYhxSq72kyF4S1zkLcyJf3orOKz5E5qzj3zx04h3Ineku/Hr7Y8M2N6enlWHxpIJo/
	5PAHyVGMc4lrW8s72PUHTBeY5iq2f/+uBw8KeEaWLdg4mQtVZcewjCpvfog/eEsLQ/r14xO81Fv
	Nbie3G3Pw8e12dWDNcPVLwXNFVvfvnq+9KLOZSY=
X-Received: by 2002:a4a:ee98:0:b0:664:55b5:b289 with SMTP id
 006d021491bc7-668c82936e7mr1672444eaf.24.1770135517879; Tue, 03 Feb 2026
 08:18:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260203123209.182175-1-rchtdhr@gmail.com>
In-Reply-To: <20260203123209.182175-1-rchtdhr@gmail.com>
From: Rachit Dhar <rchtdhr@gmail.com>
Date: Tue, 3 Feb 2026 21:48:25 +0530
X-Gm-Features: AZwV_Qi00lKhrwjA_HtCxeBRoHKEjteqTDdRmTQX-yB8BDYHudR3LfnuwkpONhA
Message-ID: <CAJH1ELDtpYQvrG_Rd8-XtTk6Or5yDT_nT3dT_s8UGg-mpnAwWQ@mail.gmail.com>
Subject: Fwd: [PATCH v2 1/4] staging: greybus: added comment to mutex
 declaration in fw-management.c
To: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

---------- Forwarded message ---------
From: Rachit Dhar <rchtdhr@gmail.com>
Date: Tue, Feb 3, 2026 at 6:02=E2=80=AFPM
Subject: [PATCH v2 1/4] staging: greybus: added comment to mutex
declaration in fw-management.c
To:
Cc: Rachit Dhar <rchtdhr@gmail.com>, Viresh Kumar
<vireshk@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder
<elder@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>


Added comment to mutex declaration, to resolve a checkpatch.pl check.

Signed-off-by: Rachit Dhar <rchtdhr@gmail.com>
---
 drivers/staging/greybus/fw-management.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/fw-management.c
b/drivers/staging/greybus/fw-management.c
index 152949c23d65..07a0e6b63cf3 100644
--- a/drivers/staging/greybus/fw-management.c
+++ b/drivers/staging/greybus/fw-management.c
@@ -28,7 +28,7 @@ struct fw_mgmt {

        /* Common id-map for interface and backend firmware requests */
        struct ida              id_map;
-       struct mutex            mutex;
+       struct mutex            mutex; /* protects fw_mgmt->disabled,
and serializes ioctl */
        struct completion       completion;
        struct cdev             cdev;
        struct device           *class_device;
--
2.43.0
