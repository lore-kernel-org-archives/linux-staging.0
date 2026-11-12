Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794493968;
	b=PktzTmrrDEABfM+fHtDdmCvskU0a0XHV1b9fS5GkCC9iUSCi35fZffjEg89PEse5Od/y
	 fBS1jw3biKA+XNx83aMQ0CuymDNMJDFDAIe+YT/gDX8W7Tnk5RMy8RFPMKMZth04Ff+TQ
	 cZu/ufHYH2oSvyj0FW8su/TKrUBnWvUzNB09zbJTkGTkE/Btg3gxW8+8b9lkQI1KFbvzr
	 CH1VrQIluLu9pLsjH2dhQdXEOeRpjgwYZDo/xiSVoXyVW7EwcQOCke6wDX2xwp2VUeJD0
	 KUWp3lAnwLqrjkc5IlLg79wZyCdQRDBtvWqzsucC49GnknIm1bvSA5+0jDEpOneu8cQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794493968;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=mZcXDkDM4tLOIZWuTJL+zhEVZpgEEqZKEtZyr2yGvYY=;
	b=0GJx+uD6tlFkm4qkEDlDLJ/M3yTpoXxaO8SRm5rhDNpG0JfBsCbOJYlMb5qryW3wqMFN
	 gfhN30RyANXDX2Vcbx2vEsvTLaoM3kvfOkuaAKWFQW7CkhwERcRGvS3ZVJI8SKaqXMIkW
	 Sik34ntBylGt8ob3R017CJKckCIi/2O28WlZoaVXiHoW3sCYXeVhV+nP/0QtwZBdl7Oeq
	 D+7HZ3O5PdEKm1IIlvkoh1X0ikRqY/OqZiwRSg47WdN/ZYAKPIazacaugIk+rkQIMX4EI
	 8OpwqGuGT/uqoaW8d1kluzBelcyFCFsbf1f+gOYU2zuyGIuMxr3WvglTErs0y0Zs3qw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QI1DvxYn;
	arc=none smtp.remote-ip=209.85.217.54
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBF35606A33B
	for <linux-staging@lists.linux.dev>; Thu, 12 Nov 2026 14:32:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBF35606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QI1DvxYn
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-7cc3eb09dd2so1372908137.2
        for <linux-staging@lists.linux.dev>; Thu, 12 Nov 2026 06:32:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794493967; x=1795098767; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mZcXDkDM4tLOIZWuTJL+zhEVZpgEEqZKEtZyr2yGvYY=;
        b=QI1DvxYnKbdkwjiVAS1kKA9IHhc6At/O6EOi5M86QXpG2FDb/JTYpFcRiOAOF4XUzU
         7eGe+tK1yeWGCxPeWOOqo2ATrKpH6gkl781plKgl1V6HD5O4q+b2ZdIpcvjqZslC+YYD
         nOZ6J/sXchimnl779j1fHzxsg+h/Zr0MMMxEkbksx3ht4fOa1kTjfWRQzP5B6uPj3BiR
         4n/x+5c1YLsQwc0Lctd7OD4mblAb1IYuPcCvlVrleuojYDfguJHIEg02rZ3cLCS9C25t
         FAAdyF0coLmANX/7ybGmpP2/RNxty5R78Oaz/ICIFAH/i2LR+qzyGryMF0HxkYE33x3r
         T3OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794493967; x=1795098767;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mZcXDkDM4tLOIZWuTJL+zhEVZpgEEqZKEtZyr2yGvYY=;
        b=iNLqarV2ZVa3yxdVfFABdvBKZ+YDi/AGPA6C2oeuoFesMLipMab6hdx88wVnWNqkIS
         kFsKSL+G+NHDU66x2wzEOtIlbLhcIjodTmhEdlPFCJiocaKR0N1ceGFMXVVl8S7Io4AW
         DcYZYXcWNn5CgnyNmSusx2qWy31vbr85FwtOaozBqFzuI3j4ycfxR8ex66SzTJN3KtMv
         vM4LDOgLPwboMTwP6BBGuZdTpcunlCNfJBAvkC36uDgkaD9JsjsSIBr78eFsgsD3MC5D
         4A/pOhYGnQxHnsve7rWyBbEMhGN7gFz8EAWmhOxE30F7zmP2n1YU2IsXV7ss7voNexgS
         3AgQ==
X-Forwarded-Encrypted: i=1; AL+hErEalouN+Je3mTwGlLtQIERtIY11T1UELtyRPuFBOB8F99GeT/35gLdyHmB5ucndR/viAh1yO9h4RgwKZMF5@lists.linux.dev
X-Gm-Message-State: APuU4Z8PyRjEwNXdjAW471SBJZXpdupwq/fMazR6lkDvtvv4XgLBkXSN
	B7k+dz2IzaKZq9Z3dkCYrOHkQf2WpEoEmWK1ERvhXoS3cMvGb06aHVii
X-Gm-Gg: AYBFou0RiWAWK6j6M5VIrQUpDkRImN/Fh5easU6zn7LXvjv/Y+EGZd7JFD5rIrFKYCS
	XkGWLi2Hnpum3lGCTpbTmuJXXY+xY9AMZ6Y19lhkGd9cI8cTAuDAUt2SGqGimracH/bVg8B7rAT
	Ag4Zm9WwOIHoh2IZgsWezabAyfwAHDws4L+mB3KGjLGKQDo50Oa6kRDw8owbFRZs2cSrwwkq/6t
	SR8OrbY3PaAjGg3driYJ/oeVqO5DGLBzkjp4P5gUy+wX97rh0+SgE3LQdCCPfsp2PQ57DtJhsfu
	CWanVPtu2lAn5NWW68lfOawLKQ8HzKlZIuM8vXD5uZKwyRAFc+JJtq5n4CN9LX2pApCllhVl4Ii
	dkVd/HvaXh51R9I6ejn7fUAd/wHsp/R6oHP35L/Gx/zEe4gyfckbOyV+TUsJm8QbMuIpo8SblBi
	+k9EEBEmZRHxPaVTejABryAsfV0x7T8/ZpjpvG3YOT1GOGOZmYQybi29MdGkegY8tmGwidOecSL
	jE7ha17VwSUaSYX42jEAZ2wDDDZep9QhbPjvczf1AlyusdEgt3Ixo0M6A5WZeb+KlMy5zUbFTIs
	/jvKCrVGog8U8PgpDKU47bHphfxu/gkkpA==
X-Received: by 2002:a05:6102:5cc8:b0:7cb:288a:b68b with SMTP id ada2fe7eead31-7d506146d9amr1933561137.37.1794493966318;
        Thu, 12 Nov 2026 06:32:46 -0800 (PST)
Received: from fedora ([2a09:bac5:565d:323c::501:5f])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d3023aeac7sm5761387137.9.2026.11.12.06.32.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 06:32:45 -0800 (PST)
From: =?UTF-8?q?Oscar=20Alejandro=20S=C3=A1nchez=20Lucero?= <aleszlucero@gmail.com>
To: Massi Djaiz <djaizmassi@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Oscar=20Alejandro=20S=C3=A1nchez=20Lucero?= <aleszlucero@gmail.com>
Subject: Re: [PATCH] staging: octeon: Fix return value documentation warnings
Date: Thu, 12 Nov 2026 08:31:58 -0600
Message-ID: <20261112143159.60591-1-aleszlucero@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261110171618.4507-1-djaizmassi@gmail.com>
References: <20261110171618.4507-1-djaizmassi@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Tue, Nov 10, 2026 at 12:16:18PM -0500, Massi Djaiz wrote:
> Running "scripts/kernel-doc -none -Wall drivers/staging/octeon/" reports
> that 17 functions in drivers/staging/octeon/ have a missing
> description for their return value.

Hi Massi,

I applied this patch on top of staging-next, verified that
"scripts/kernel-doc -none -Wall drivers/staging/octeon/" reports no
warnings, checkpatch.pl passed, and cross-compiled the modified
object files from x86_64 to mips64 with no warnings on my machine :D

Reviewed-by: Oscar Alejandro Sánchez Lucero <aleszlucero@gmail.com>
