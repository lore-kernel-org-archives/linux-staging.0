Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E0401D61A3
	for <linux-staging@lists.linux.dev>; Thu, 12 Feb 2026 16:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770915436; cv=none; b=UGBQxmDDioDkDJYxWsepxKJn6G4WXr9Xq8UOlRq4x85Zy1sOf2Pxl1dE4fVHNJBRy0f4q/deK3/Nj6tcBK6g0NEdxGe4pVXL4R8ghCiJa20YW1m4gcUWRsxtooIN1Zzb2y8ZaKGVfdYpG3NU6EL3AVE2nWDyoiYEeGBqxBJD0gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770915436; c=relaxed/simple;
	bh=r+wlafSK8belLPBL5mqyfMhF21YBjBvb4OGvYm15tuc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=kiMpwStsol3ouMjKFIrotTiNcoig7LQxB8iyAw4/sbG8rjdc2bcZ5S+X3nwlsclTRowyNBEMARPR/zuXzL0hl0WyMr6jjxJ27TQEk5RCh4orMRnlEGa8zd31Fwjdp5jfgtTqp2KUhoai0jaAMzxiEVDv+p2jRcQOJFCGHEuJajI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LVzhD9hs; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LVzhD9hs"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-7946a1f2430so988877b3.1
        for <linux-staging@lists.linux.dev>; Thu, 12 Feb 2026 08:57:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770915434; x=1771520234; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kPEEd4gi1uVyaELpFb4zmFDHu7Kah3SPRI6dwET/Dvc=;
        b=LVzhD9hsJUILj2zmcpd9ODoQAk1HvjnJnC3OVUIQpVTfyEK9yupzE1bbmfPXUpERi/
         Vn1D/OW6rKr2Lc818Fiv7el2JCrV0Cf7HHuYClDCi8mUktAAsvJV4XyY27cABnZHx62X
         MGGYZpatFGu+grWmH2v1hZUc/P0guybz6n5JzuXI/zjHW5NHBoI6VZZJBzCeZc9cvJy3
         +KuM9Uu6//4pMzWs47McteOozukZP3XlBcIVjdzoAC8xQwTQPavepSTvUyc4HuDwgWds
         EjNvU2ySTgShI9arm3dvvtM2x+qZ4AUzZ4mffgjt75PCarS1G3dNDgGQltcKP4MHtcdE
         oDSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770915434; x=1771520234;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kPEEd4gi1uVyaELpFb4zmFDHu7Kah3SPRI6dwET/Dvc=;
        b=rH+KuiliFoTQRUc85mkmJBVq+OduygHAPpXv/YL/pxZdN/Xx2HihOFDeKCwyQXXJ4X
         CEv2K37vDsb+26Auepg/suUYb1l9e8Ne7H2vu7hURa3vlM8VaYScyH1TOkaRj9IeI0MF
         uymdy3d0fUfNvwAf2G5yCS3hQjk2Gr+PE0LuUS4lnLaOp/jd/rM84jgF6weQH2tzl12S
         1UOsY2egYZAKewxjonNrzb6X8yk4a4E5rd8eNuG6SU+O+sVT06q9UzBPGyFrN2mQ2Bsv
         GT+X+I3G2TB+Q/MxFV5fkZWbSWmaoZzuS7TviAfu6Oiu+WIEzXGhmrW5GhW/iaKZlR+i
         iXWw==
X-Gm-Message-State: AOJu0YynFq7R48s7d1tPyRtiVlhfTUusR0SRHf6S4JO+HJbvFWt1v01r
	IMAFYUr+zZCMpBoHy9enyJUw16SipzF+0UtPCQRLcZ0BnBmBeadJG/nm
X-Gm-Gg: AZuq6aJZmrVEx937sVx3okEl9kiIcO/FsoW9a4chRCtibsQe10kgknl5Hj5SjoFsRIJ
	I83bo2u8lQOWQ1sgAvnHHSXlXF9HcFALm8na8q8er7MVu7rNlFLmkjcMRuz4KU0rMC4tBc5QWvF
	Jd3NWpOyaLm8jKxWyxsYUFxDudWt1uhNB8M9z0D0L2BWr0krZ+YQYRVhDtpJ2wuu8P4CfCQUZV5
	JShYHTAISk9ZEpXNusZ8d+1XhFEZV04DlAd+HU2INPxHAI4ns1Ky9ISMLIvwD55PER9iVOqV4H0
	Hpv696PdWUsJKMMGIEIdax0nI+9CfUeeWr2YbLqmPHB+0OZFmVBsWfRDnyYsfRa6/U3KSH9tti9
	q+WHO5OKMoWek10VXuOg2H9Bh3L/g5TkaGN7VfDgfqJHIYG1E2EzTcczgpI/p+0Eb+xtuZD2cU+
	3wN/hoWt2BXtJlg/OVhWPZm0RdCvij2wtXk/onvXvgojvhdvp3Qv+ZY+0BYhUnkM+4tJ4aiARz/
	be/11V8qAET+JwRX3hn29uItktmli8A
X-Received: by 2002:a05:690c:e08d:10b0:795:16ae:83b9 with SMTP id 00721157ae682-7973768b294mr28268967b3.68.1770915434265;
        Thu, 12 Feb 2026 08:57:14 -0800 (PST)
Received: from localhost ([2601:7c0:c37c:4c00::9944])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7966c23d1edsm52305977b3.29.2026.02.12.08.57.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Feb 2026 08:57:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 12 Feb 2026 10:56:58 -0600
Message-Id: <DGD54GBWGT7J.3655E40MXZLE9@gmail.com>
Cc: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/3] staging: rtl8723bs: fix blank line style issues in
 rtw_io.c
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Sarah Gershuni" <sarah556726@gmail.com>, <gregkh@linuxfoundation.org>,
 <dan.carpenter@linaro.org>, <arthur.stupa@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260212082358.3403-1-sarah556726@gmail.com>
 <20260212082358.3403-3-sarah556726@gmail.com>
In-Reply-To: <20260212082358.3403-3-sarah556726@gmail.com>

On Thu Feb 12, 2026 at 2:23 AM CST, Sarah Gershuni wrote:
> Fix checkpatch.pl style warnings related to blank lines:
>
>   CHECK: Blank lines aren't necessary before a close brace '}'
>   CHECK: Please use a blank line after function declarations
>
> Adjust spacing to comply with kernel coding style.
>
> Signed-off-by: Sarah Gershuni <sarah556726@gmail.com>
> ---

This has already been fixed in staging-next. Please use that branch when
submitting patches to staging.

Thanks,

ET
