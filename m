Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B431E36CDEE
	for <linux-staging@lists.linux.dev>; Tue, 17 Feb 2026 16:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771346792; cv=pass; b=QraiYcGPA1WAoAS+s/jxmlriNKpwKvgyM2+DOhNM6GaUkxQjTUjyxrkiJN6i2u1eQy+C+Hecvn4W+p7QgnjBH0dZn5UeKYPY9jSFLelcc84zL5A7uivyZfBA72I4JCMg7XCXHsuhVR8GN9ek+GO9xYincnRWqnmhtGUTlLrWK2M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771346792; c=relaxed/simple;
	bh=Q3Gc+VZamLR6t5v10OZfNXCrhdZNMSYiclZlcFKVd6I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MJNw/xD3Ar7KPAi2ERDajMTC4EYDq6dcvMNKXR6KLgoQ8XQnKUcZaj28cesC1thycrdd+bA45+mJw/cGWL3pwV8rXFtut2u2VF7x5Np8h+shI/51Qtqe5Q2vbUD2y1xOgESoN5Q+yvHeh9Fsq/jFUNESWihkALQAiH1ZceJ91LA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bsvO0edU; arc=pass smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bsvO0edU"
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-649dbff9727so3954289d50.3
        for <linux-staging@lists.linux.dev>; Tue, 17 Feb 2026 08:46:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771346791; cv=none;
        d=google.com; s=arc-20240605;
        b=aQbHhr2eLV7HKVcztdpSLA8GHCpTz8woUendbMk6usP9PfQ9b5kIr/mlHjkWj4ACGX
         UMSTss8gUk4Lcfv2ufCRg0UtGZs90Aqpkf5x04oawm9jXShQmZ0NszPpQ0vWHR+Lxma0
         XOacUPbd1V/gGOViNHKx1N8DfwdP/wFhaMP1r2ezYorVspGLeRXWjMA/JETgElZrcn+z
         sgLArxvEEGMNLmh4yGD2A9m8DMPwR64cQ9OoK0i6dg6lgNb/ozPtyNQAwWuhWIOZIUt3
         iovldwyKiXPxsXKDe8e7cjcCb9tTznn6r+4W82hD9PfQPhWIKw9wIZzZwOE3tbxBIfb7
         lx6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Q3Gc+VZamLR6t5v10OZfNXCrhdZNMSYiclZlcFKVd6I=;
        fh=KOdB5k6cRvtzzan2XO5UmrtCbSbNvzzqCrLdTvrRZtI=;
        b=iKnBpAM6RCtDfnE4oAYGG033Y6W4iJDU/PyvWfEhApBCRgtJ6AfRBjNk3buOtlj5QS
         rpOX1PQsWdguyWpRxG8huJkX6ul+jAdJ6GB7j4diVNiMyKBJZc0mXGOqxGEaFu7E1HQK
         TpKPNiZNN5FDyHQ+kwtwHoQejQrIwJFjhp6tQzqZGSV0ScY1029ppZNqgv7bEZWeSePm
         b0afxEYDQXOxKKr5I34tO5WP89Kt9trgwzI91ZRt7IZNN0h4WLqVCVKresNEfGfVeC0H
         yaq36PoywB+0WofiLbNc/D3O5+24CET2IPI6QxStjCDImjgP91nVn3igpmxL26h/rtlE
         xD0A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771346791; x=1771951591; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q3Gc+VZamLR6t5v10OZfNXCrhdZNMSYiclZlcFKVd6I=;
        b=bsvO0edU+c73UtRnpdSReKUI/K8ciqSj5/ZxJS8hggq6Y351WnyOpfc/tdWy1yw0Ib
         D0xb07pNdZHduAAMDg4zqn4ExA85icG02EPZlYRA1mIiNwg/G31qeaCc9AV0QmeuvbpK
         bZI97wLJeOwlX2ZEkdZWs66oy8x4oPeVimLle8OB5bljTOHiTYbn3n6wPeFIK/OQtMZr
         MXSNsKFhI3adv7hxwdMt9stCalfAIXpwo62oftNpai9NDD3wGAWWSW+GpcRr50uKRCqe
         Rcv7Jywo/dzJNDPNj1a82FCU6DJztBpyJlffcXYrYJrFHM2LP0DUIqgpMPd+T+QPNPuD
         ygEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771346791; x=1771951591;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Q3Gc+VZamLR6t5v10OZfNXCrhdZNMSYiclZlcFKVd6I=;
        b=QVMga5y9YSZDMIFmKLWsC0+JLRo4hOlS0087OjcxS1sP0l8ifyuNRSlS1bfJFT5wWy
         qo5y5MMNlADIf23+lLz+Qw8g3Q5KvCSR6p/aQyiJ1nTRdVus+phdW1KO9PBB0ANepdw7
         n8GLVOrNN1utvKKhOhu4SgC/oXotJSehEc22gVxonyLsgvf1atQcqqtuRADNv39RRB2Z
         25+5qh4DsFScJGhguahMfqVjlUEwqHztxwd6/An77El0htBSMxRZtLj0w15t49IpUc60
         //Qvvtr+HIvQdKI2WoZ6MzJoI1hl8XvzabVUdBQ0xnVtv+klMLLIv63wFsoMpRosAo1f
         lKHA==
X-Forwarded-Encrypted: i=1; AJvYcCX+s+LsfnKxl/a/0O+fmst9Pk+AEVfTLdIoN3SxlEMc2M9eE84nfZZdLTyYSfLs8XQV6KkaMJJxZDANBoMs@lists.linux.dev
X-Gm-Message-State: AOJu0YxbCz0HePlR19uQT+Y8T9t6ueZiXhW05IJOZFclKlI/VjXkNADP
	f7+Fb2vy17k5HsuFTv/A80u9MonHB0XM8K/IPp811zwxG+hT5rUKRduU0U+XWnILzF2QOXoEzl+
	bGtIVxVpINsS+F4rxziDi5ARfPb3/Uso=
X-Gm-Gg: AZuq6aK5buMBVkAjtcMB5FxlgDjb9bGc0/AXxa0ni0RD5ZwSAOtlh4j64ruoK5FPSjv
	T7HzQpBiQXq7mTTrovhLeySP1ngoYn/PLfQYI2jTzATbpoFOM8XrW+/O2A/19+n+1zTTkmp2UZX
	qwd/bKydKWkfPyV7oDn8mSQNDsf3fj/R0nvkwfh6c0JipGkCdSXYixQoJZEoBz7D63sG2syok3U
	uk1J5cZ5JliViHUrY0+IfXRISTUEvhG0P9L7F6esy+/FNlT3XZiXTMpGARi1IyaVJejIDVRB9pe
	LVFeF8abZ9H4yZS5Uv+kJYFtqG2A/Ho0fQB9J90=
X-Received: by 2002:a05:690e:13c8:b0:64a:d574:8390 with SMTP id
 956f58d0204a3-64c21a40fd8mr8098286d50.3.1771346790523; Tue, 17 Feb 2026
 08:46:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260122145633.14938-1-architanant5@gmail.com>
 <aXI-ZV4uAd5GyFLz@smile.fi.intel.com> <aXI_HnvDNbX68-lq@smile.fi.intel.com>
 <CADJHxWB3b+bH2+HBP+SG0jxhGNcozstBeWeDH_3dgS-4c2G-6g@mail.gmail.com>
 <aXJmYAZ-8KkXCFI9@smile.fi.intel.com> <CADJHxWDCer97pMNHV-69B9AEVY0NfimTcxo8k8yFBbstg0wMQw@mail.gmail.com>
 <b27c638e-f0fb-42af-978f-89e38dea2b23@baylibre.com> <ca488ef9-f4f1-4f7e-9656-8c5d132d0d1c@baylibre.com>
In-Reply-To: <ca488ef9-f4f1-4f7e-9656-8c5d132d0d1c@baylibre.com>
From: Archit Anant <architanant5@gmail.com>
Date: Tue, 17 Feb 2026 22:16:19 +0530
X-Gm-Features: AZwV_Qgc9JOZgqqpgqUfNDf73M-bLvXTIqoUfS_Ygpy758Vq2PGiyoJW4ZRWVyc
Message-ID: <CADJHxWDXqgpbK1+cffhPeTEz95L0zeCGGWb96_QwuxjEofBNKg@mail.gmail.com>
Subject: Re: [PATCH] staging: iio: impedance-analyzer: ad5933: use div64_ul()
 instead of do_div()
To: David Lechner <dlechner@baylibre.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, jic23@kernel.org, lars@metafoo.de, 
	Michael.Hennerich@analog.com, gregkh@linuxfoundation.org, nuno.sa@analog.com, 
	andy@kernel.org, linux-iio@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 17, 2026 at 12:34=E2=80=AFAM David Lechner <dlechner@baylibre.c=
om> wrote:
> Actually, I just saw this was in staging, so I guess not breaking userspa=
ce
> isn't the top priority if there the other way is objectively better. I wo=
uld
> assume that testing/measurement could show which is actually correct.

Since I don't have the hardware to perform those measurements and confirm
if the precision improvement is valid or a regression, I will take the
conservative
approach for v2.

I will send a v2 that only replaces do_div() with div64_ul() and uses
BIT_ULL(27), preserving the original (mclk / 4) logic to guarantee no
behavioral change.

--=20
Sincerely,
Archit Anant
