Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD3283D1CAA
	for <linux-staging@lists.linux.dev>; Tue,  3 Feb 2026 16:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770135602; cv=pass; b=JW1q07FzQAzjGTxlACtfdauKA9jxx9XT/CPHWJUm19drJ3I0gIzHmV99LXZn57eVlPboOve53tMMb4xZLa0kTsyhHURgGTaBA/3AcSbo6WxK7HIgW9wGPH+T+lRkGs0oipBWMRCe1fuwpc5PtKynXFEabeUaR0vvqhd3/JUt5zU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770135602; c=relaxed/simple;
	bh=Gv85eUEJzBX4RqIjk83+VZoDjxmoEGDKdRX3bZqi6zg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=ZqrLSj548lP57+xcxpYlAy9/7PC7oK1gj1Wk0ho31j+n0UTNeP2y6oIVG3J/iAQMK7/Lsbs/LqiA4BHAUrSY0qp0JWAKcSfFAkXoCaEhwMHlfPmwETVNk2JXDiFIbzvejIxUyzafWLFIAHfgbnhc9dx5ki9Mp7cvwOtZO+UtXMg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fINtl8Z5; arc=pass smtp.client-ip=209.85.161.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fINtl8Z5"
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-66a2278a37dso37973eaf.0
        for <linux-staging@lists.linux.dev>; Tue, 03 Feb 2026 08:20:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770135600; cv=none;
        d=google.com; s=arc-20240605;
        b=kEBmDZuCSFqao4/ybsxhTz2YA0Ho4J2qSRDMnBfuwR/bpiDL2Xs7eMYudVVefTQome
         yZfHj17GDxQgocPIp4KOVe0VQAUUdO3nZIqGPTRnBETmHyuhYcEG6z2bG0EmsUzEQZ+P
         sjvKqMi1eYd3uYPGN/+lPNHBHi+OEXYnLniWW7uYJ1dgFcNdtWLfynivXP1mkCvBg5vT
         aG2cdRnQBiV8dH38Oq3TmxemZeJPGERVUdD2I0hdWLfqipRsk+FzKl4YbVZ94Jw/ScUU
         YQIUs/uI7xI/dmuw5WbRv3FYt8DMpwRi2P/RNEkErgtfhGsyV4WvksETUXo0IqPRYOh6
         BfZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WetA7aOWSHfDFPg5y9lxJ65X/k6to1Pjcd8Gc6hn2U4=;
        fh=o0lBnk7cxZfGXG6+f7DXX/qA7khmam4p3/3+Aj6r/1g=;
        b=MZ1ppGgjJSOzpZq01d/7uk1T0aqbINSTJNA3ObYKEnZotA8sb7O7nWM0MKCF2BRGRs
         lmfQwqRGWTWTl/24D4j+CDmGKzEUnWmZrg4H9B0c7Pl5kSKqcEi+cdZGqmvAXggHpkNa
         pgCP1XwVe8fFZ+eDU503q7fKIWEobaxdOKLzsKDw89K8UpDZwuUkgbWK4msAC0dhuQX4
         A3tuVWMlINqKk6Es0w2/J2mighOL99oTmzaSnP1jjHhMX2CLecMkoGABEvY1xFf8Xn3h
         r+nVxNiT5qeg1XfIwJu92IK+RX7WnMJ4bBdghFPwo6iz3MtRr6Z1FZWePXn8yv0OESzi
         eL8Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770135600; x=1770740400; darn=lists.linux.dev;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WetA7aOWSHfDFPg5y9lxJ65X/k6to1Pjcd8Gc6hn2U4=;
        b=fINtl8Z5EhnOtsYhM+QQsw5hxexa2TYLMoo/qRzzCr+qUgKcyO20xJdfPOxNfaAjBV
         JAvSa3AJnx5zz6PuVLCN2qcjneHOj4GVWZ9O94sxfgYm4sSnk1ewW1MDFK7+rKEb//f+
         wW6Xh5dBLUhAg6EVs8w3VwsEIaOtlLWtuq83+Dt7fO5F7pSY/DuGUSPM7UJY4ltFm3Eb
         QmP8AC3LojDOmuBHYfB2yHPTrNDFXH2/sVxKo25wI9Lo8IIDpMwObmBnpm7kI+00UWYP
         Vo11AiluvhVrML2wJrMzb/Z1NlEypeSgo62009yfUY4BOarc8FiQjNQ+8xHH1mtmVYnu
         mp/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770135600; x=1770740400;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WetA7aOWSHfDFPg5y9lxJ65X/k6to1Pjcd8Gc6hn2U4=;
        b=D10dftrUaGrR9uYPCIM5w/KhlQ005vlYU6hJrGYsMagLFT2KvoEyZV97ue789O5ZAk
         meesC8Mh4U5XITR1vvhPC4+cQXTVkpr/8AoQyc1h5lffLF/BAIuzG//iGyFXikMS86EW
         lObJTeN2wD1oYoNAnvsViGt/aFUDBIhp1yiD5rhElW3PWM3CFnUBMcRQMHHQ7/jSk+Ro
         xDcgeNhNiiWOgi1zP0k34VE4KuSv6uEoWLrsjtf+SNbi2vSVYnMtaP9i19f2vNC02MvU
         18ynhUzDtX5+KQUkltOeY+J7+K2EedqJCr7THyJsqoxNpTVeP9j4yKT/Im5Q5dQl4V3j
         vMbA==
X-Forwarded-Encrypted: i=1; AJvYcCUll45JWQw2dEboi8jH2nFBSyQ2HrVFpPqGj21wIVP7DjjqK+3mlYMA+UFeN6Vd1xurNIs1mGOc3wFdC2f3@lists.linux.dev
X-Gm-Message-State: AOJu0Ywy+ij9KNzDrkJ9s7vD2vTRsyxaDmtLliWMazDHYK7h5mK4xIZu
	oTQwQf3fZw6eCRjona31jS9nAa7p3CO3khjjZ5Bf0wxq02F1KiThSaLQtDqzXOgr09tWeCKYdzf
	uJ3nxNyqVLLQZdvBzKWir/NOkx/Q2d4uL63io
X-Gm-Gg: AZuq6aIol2BXabramqjK3G4J5uaHiJfSlmHTrxg5/ReeB0kpZmwq9HxBjyiMCCCMDIm
	hBnJ09gYCbV/oBwLo06cNi9jNpUr9wCgOWBEiUWX2zjHlykgEqc+2D7KVScV3BCcUH/OVxqLTjv
	dbwWcSLV4Udvj0tg7f/RWCOTHQwWAJNfkaLyzdTIrDG+ybcMZlgfJF0n8LVLU4Y43lb5ABWGF9c
	JLol3Y1ymRE4mjGZjOyEvra1hVIcp6LFsHuXcZW5cHR79iwp9D0NxcKNXy5Nzz/QnmYy/AXPpw8
	uG7tCPXaEqGKalOPUjdAoC0OHu+5
X-Received: by 2002:a05:6820:3088:b0:662:fc84:fa6b with SMTP id
 006d021491bc7-66a229791e1mr82913eaf.49.1770135599735; Tue, 03 Feb 2026
 08:19:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260203123209.182175-1-rchtdhr@gmail.com> <20260203123209.182175-4-rchtdhr@gmail.com>
In-Reply-To: <20260203123209.182175-4-rchtdhr@gmail.com>
From: Rachit Dhar <rchtdhr@gmail.com>
Date: Tue, 3 Feb 2026 21:49:48 +0530
X-Gm-Features: AZwV_QixxKtScMC_6qomvBkPjkiAUAqbU_5bAORIQLIyO9k93X_c149EigcWvyA
Message-ID: <CAJH1ELCx6zamcztCVqmyrDG4uMoOM=S9Fb6resQRXZ0xrScSyQ@mail.gmail.com>
Subject: Fwd: [PATCH v2 4/4] staging: greybus: resolved checkpatch checks for light.c
To: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

---------- Forwarded message ---------
From: Rachit Dhar <rchtdhr@gmail.com>
Date: Tue, Feb 3, 2026 at 6:03=E2=80=AFPM
Subject: [PATCH v2 4/4] staging: greybus: resolved checkpatch checks for li=
ght.c
To:
Cc: Rachit Dhar <rchtdhr@gmail.com>, Rui Miguel Silva
<rmfrfs@gmail.com>, Johan Hovold <johan@kernel.org>, Alex Elder
<elder@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>


Added comment to mutex declarations, to resolve checkpatch.pl checks.

Signed-off-by: Rachit Dhar <rchtdhr@gmail.com>
---
 drivers/staging/greybus/light.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/greybus/light.c b/drivers/staging/greybus/ligh=
t.c
index e509fdc715db..1f2faa6d545d 100644
--- a/drivers/staging/greybus/light.c
+++ b/drivers/staging/greybus/light.c
@@ -37,7 +37,7 @@ struct gb_channel {
        bool                            releasing;
        bool                            strobe_state;
        bool                            active;
-       struct mutex                    lock;
+       struct mutex                    lock; /* protects gb_channel->activ=
e */
 };

 struct gb_light {
@@ -59,7 +59,7 @@ struct gb_lights {
        struct gb_connection    *connection;
        u8                      lights_count;
        struct gb_light         *lights;
-       struct mutex            lights_lock;
+       struct mutex            lights_lock; /* protects gb_lights->lights =
*/
 };

 static void gb_lights_channel_free(struct gb_channel *channel);
--
2.43.0
