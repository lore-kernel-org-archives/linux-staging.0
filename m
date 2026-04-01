Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A1143E4A3
	for <linux-staging@lists.linux.dev>; Wed,  1 Apr 2026 13:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775050763; cv=pass; b=dQnqbqzCdTXTyb6bL6i5o0WxYD4r9ffjsHJfta+D3cVgQo+He6pGVXq09z0zrkCPmiCeiyIIo0C6evjLRS6OCqjkYdWLNzgwSG8XUBbjGF1vFl742c/HHRk8RMmYWHszzLX66aSO6rlsogld38S6H3LO5Sax/w0FzCaMXCdppxI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775050763; c=relaxed/simple;
	bh=uWpJc3DoCiKhq96Au0u/5kNy7bsjrlzy9/z7ywJOwcc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZqctuXg9Uh+AbWwq91Lj2ly3Oer+O4yHM9xeOkZcggcJNBOMck6+dZwx7FtM6xhED+MoM3CVRerWbzEN9YLmS/tfu6wbgEDy9Fw5SO87jOUcx/OM3voneaC4FfoeJLWmhvbkHX3yXeL5mrNuQTz0Wz74v9jZQfFnPZ9yT4DxF0M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T/iqc0ua; arc=pass smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T/iqc0ua"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-66c17372965so5013992a12.1
        for <linux-staging@lists.linux.dev>; Wed, 01 Apr 2026 06:39:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775050758; cv=none;
        d=google.com; s=arc-20240605;
        b=QW/naA0ArenwoQ+YaIxnj1ZcrsbzKdO6AFsHP+IlSUf1n6dm+9pj9GclaCjEQpvEBW
         qnI/eYnhhZpVbiwxtXI+41Mfp/wzCntPpmaYNX1HodLOb8TiSNd+UHH4fH5MkerJBiWS
         lPSVcCBXTncRaZXDs95uPAqFglS9ZDe5qD/BrTZkqkOPFSbTXf2vFZ92pvV3UcJz/ClL
         wFoeculWfo6jUBD28xgJit8V/3Bw/UOZkiWypcJ9G3ePog8lv0KyPRnvAbSYnB3ldZfo
         5tRDSTKv4G2L6t4oHAtKs+xN4CKT4Miw7fy/BItE5BG4vIepvLzeoEUhUXFzeH8SWYbB
         /hFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uWpJc3DoCiKhq96Au0u/5kNy7bsjrlzy9/z7ywJOwcc=;
        fh=2OoLWEf97llUWboHO99mad/rs144UtvuJ+M4ZPD6H18=;
        b=Q/kwZdOcuptPJtCRufU3Gso7Ewarkg5aK9NOwODc10pH39iUvCLWUY4aibGGy9sW60
         K+87kvqA8E+WKCwHxKpu4I+rxIJm2VuXpJg3hghI9ZBmv9wny5kmcFqyWDW2Y4CCJ+ah
         P6SmBul4CLHdPkGVddoybrtJkvt0hUHqQjWeLkiXse1DTZZgTq7JWBzDGa1IvNpvBT94
         6V2pHrnHQBounWkqlXtM3wQFsXhWqgScgwsdYSpJV0baPPS+FHrY+cB3vzz60NOK1fXu
         bDWlMNC84ySsR4AhVKRXIZLpVuM0iiOdrvxg6x+7vDC0mkP4dOtbq37X6ZHINnq+N57A
         D+Jg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775050758; x=1775655558; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uWpJc3DoCiKhq96Au0u/5kNy7bsjrlzy9/z7ywJOwcc=;
        b=T/iqc0uavEpT39F7tZXaP0wHMXFfR+WeAk6jxvHw2SUjxF/okxpBZAorPekFRTDSk/
         5Lci9zglyDjpFrm4DmOnIgh2rLcYQNa1DpiDDTBKJe67LZgPpnc57XYcTt972I3nrePf
         aAGhNe/+/JCNLivIEoq8MoMaSwy42/wlxSixQ8CfsNP+678baCrki8VCRMfCxJLLID9I
         crhEGIMoqqukd3RYWlkckrAGdkzq2HVViGSs0wdMu25BZVn4M9vrc4eJF7VWxBiBUaT+
         hTbUM8t4SNJye9tO7DnHl4CYI+l+iwSxlYDTqDERpbLKG/aSkHBzBWClfle/zJTJHdSG
         zB3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775050758; x=1775655558;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uWpJc3DoCiKhq96Au0u/5kNy7bsjrlzy9/z7ywJOwcc=;
        b=tPe9CYelrkTFu711n8ECsARF4Sh4FERG9Mgx621qr6DHbA1c/rrB/Kuv33aRVuFoI7
         fgOk1U9XzCxST49j4pGLBcpS2VR1FMaPBfTWgb+cRgm9bUwTCzv0vZ4epfW4VdU4Hlfn
         h4Dm/8+tAufCfmZCvZXRjlqfDFyjopCSRMTQZfBKAZNsug3X4zJXlpFDXTJGIRR7lfHB
         w3QVRZkvtQfhz0U4uHGtof+5BXXsrFQvKq/pCknZGhstVrIX8vq4G76P8ZqCCqXfsg0v
         m9Rm4C3k6VU8hK17fJIEm4KktPgMcCymJBKJuRJ2KwVXfHTjsY86C2QckTCdgbDOhiyz
         mvfg==
X-Gm-Message-State: AOJu0YzwCOKO/EMyybiYOMjCZspVgO4+H1ZUa0KyMBKEOAwcfUBtFDI4
	vjbWtl6FRniZmPqzXLqnn2Kko5huG+lc/sIsoe/BqkeEi9tmsRJW5CZBMQliQm1o2Hc7RKTZRrA
	FWLOsuyXnPZchqrvPkkU6l/qxRQ/iDDA=
X-Gm-Gg: ATEYQzzpffoK+ltfCwjpUVnTYHatkk088NRNCZdAOb5S4EPHyLBwCdUr4tLsKPeLkLH
	byFMROfnMgqcfAMdl2uY85ngsOj03JVxuAbQQdAUHknM2sssFJrn+exIqZDzAIai5LLlJ4MozVx
	IWJw9mjHprx6Kl/MTZaKfgWPEyURfiiXcY1az1srCnGjMX8AmLK926rRm1qIiPk/1WByLlWnC7T
	jIweB1b8vJPiHSpipiMyHHbwZxH61ueueFTRguvkJxcQ45gRLr9VHsCb6YngRBbOcBhKLjmv2uY
	D8q2YXDL1j0OlLbLgsr5JS+n09F/Qlt7HZToVszEjeHSnBBIV/v6YT+G7j7WOE9SWBt70y8JSb0
	GwEvVaj8=
X-Received: by 2002:a17:906:37d0:b0:b9c:12b0:2e38 with SMTP id
 a640c23a62f3a-b9c137b22aamr212189666b.1.1775050758164; Wed, 01 Apr 2026
 06:39:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260331211649.421777-1-azpijr@gmail.com> <20260331211649.421777-2-azpijr@gmail.com>
In-Reply-To: <20260331211649.421777-2-azpijr@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 1 Apr 2026 16:38:39 +0300
X-Gm-Features: AQROBzDBsUH3ZdDFFl9nMBiY6AFN7MSIN0qgjmUa12sMUfeuiW5akm0BnTypkZs
Message-ID: <CAHp75VfBqpLFYbeZWRrHpFe=niek8-PLF1+oiN5XSvACQG0m6w@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] staging: media: atomisp: gate ref and tnr frame
 config behind ISP enable flags
To: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
Cc: linux-staging@lists.linux.dev, Andy Shevchenko <andy@kernel.org>, 
	Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, Alan Cox <alan@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 1, 2026 at 12:17=E2=80=AFAM Jose A. Perez de Azpillaga
<azpijr@gmail.com> wrote:
>
> The FIXME comment noted that delay_frames can be NULL for certain
> pipeline configurations, without knowing why. The reason is that when a
> binary does not enable ref_frame, delay frame allocation is
> intentionally skipped to save memory, leaving the pointers NULL by
> design.
>
> The ISP feature flags in binary->info->sp.enable accurately reflect
> which features are active for a given binary. Using enable.ref_frame and
> enable.tnr as the predicate for their respective configuration steps
> ensures the configuration path stays in sync with what was actually
> built into the pipeline.

This sounds legit and being thought through, thanks! Also the code looks be=
tter.
Reviewed-by: Andy Shevchenko <andy@kernel.org>

--=20
With Best Regards,
Andy Shevchenko
