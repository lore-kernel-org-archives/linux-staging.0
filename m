Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C04B370D7E
	for <linux-staging@lists.linux.dev>; Sat,  4 Apr 2026 23:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775344224; cv=none; b=s5ew8wWoUnNElKGThWirSxUeyJLCMJtJm2CSCGRps++E0RAC18X5oJZ63x5DhKmBe3cDma3BNSBcJK/UV93TAos05V4ps4N8KFTashiPqrw1NzDD0Z0K7S4Ulfv1bJB63D1dV2+ggXw90HHvR33oQkVmR399TYXrYlc0Rfnm9t8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775344224; c=relaxed/simple;
	bh=CXe6NWtGmgae7vomAcuBTLuO3Wx/AkjmoxsKp7IFwT0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=kTpNM/M1wJB/o083TNYXcsV3ESe0oh4O0+w5E1YkTGPXhjLzS5zHShFA1cYCJvGZiMZYvjlKZbx9BGnFBB0y6VG8uKNONP/H2V5aYqwjyAf5G6HeQmJJwBt6TOKZ6IZIQhPTk59B8vwn+b4ewgiHaSQbRPxAHXhhGutmUEFcAak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ot+5G4Af; arc=none smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ot+5G4Af"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-65009bfdcfdso3018848d50.2
        for <linux-staging@lists.linux.dev>; Sat, 04 Apr 2026 16:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775344221; x=1775949021; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s4FsZioxL2aVxVY/1E/hjnxADTNtSVDk79XAZmktMYU=;
        b=Ot+5G4Afu2Fnww8M10sR70njcMCYeJZfs9mIAi7GMXWFmrjN93LhGX7mxD6Bv5kLbW
         QfipxBCse0887YpA6xC40mcBHJKybtREBvoopz9UZqytn6L02rI7wTWru/VgDpMpO5cP
         HIySNlE8UIldBTDm4eytPD/i7ZFgxPR8z8BC/0G61o+OvDapdww8Eq7e7T8swpApDQmM
         kZOCQuL10RuRt43kpH/LwW6dq2oZ83Tq2kiPJFJcQAJmLhG3H2AMUPQaalUGi1XqKXVd
         1teV0YgHJvzJdmD9DIW/2xjwkUIjU/bB9dgg0Rvl6ruFE2e1D0wEK1N6KjbyvK5siBP3
         FGig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775344221; x=1775949021;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s4FsZioxL2aVxVY/1E/hjnxADTNtSVDk79XAZmktMYU=;
        b=ZndhGiKWIhL7EmbYFClktz7wVCXN7NyJE+PhyMZGVibwj/ddzniS4BfU9uM1Eq7/5X
         lHZePEDqlGhnWMuoR43EHVMRJSrA2+oa0Jlc9Y4ML/4HGHV+xXnEsf1ffAblzGzEDUCT
         IY9PBYd07/ZX70fQ6CIhvR7GEEyogu+0Qh8ULGQeZ96MKfJxK+H3iFvdysDZy3oyXDWF
         6W+A1/1us8Ko9Qo+i9gjoUtr74RQGTW/hgp8JpeIvtCaZATjSx6rXi8qfV4wBjIET/HC
         6vJ9oqhizhz74ZWcx2d7Mq3lrkO+qLKej2ABjF0UjbD6jODFtt40vWqKC+lkHdk2h8zD
         1Iyg==
X-Gm-Message-State: AOJu0Yyubi9Rl9feqvM76B+nPiXgvj+tj5pymfhPChifGU24wJNTS8lJ
	3yXNQO/Y0QjZet2y+szi7OT4wEviiAiAaOj8ismCLvZ4IplF1Pgh7++M
X-Gm-Gg: AeBDieuO/AvOyfEJQW6KF4OhhG/3mt+ADYeg1PihPNTFAAzSnnN1jTLXTrinPlEk/OQ
	gzRUeEdGgPQb4u0t0qEa9+j/8XFA0F4qOFyfS/RIx2OyZebxLKdQEr9hHMw8q5pBZH5z7HDaIQ8
	/8I5eL55XZ+pppptuGHlxYghzYbWmGa/D2JYBRfMvWymtqnZjr08/8V1NHYdGNGRavbT5oPuo5A
	nc6zP3IrUrkbwTuvhCgvICKSiOyOWkvKzEPaK+y5QHxUXWp9enaFCkn5uuqScOFOXkKfg5KyFHW
	0JpiTHynjBTFzV1MbhTaWpx+CsDIWR1EUjMzIMQrX9L0ZqObDaaRC5rjkdxPH6+4Fiv0hfwap6Z
	XBUvLq65AobV/dU0LwFZpnf8UlEA5EUIlO3K4dOH2594bSEeETJIlmqKcrPTWgFFXHWShy2boDb
	DzDp6eMJpJGGr2JkTEbD9lqKZ39m08C2yAvrS1e0nCmII7/JObJ5linQLQzHyGBJeafETwvelGu
	I46Njxv3tjLs4jN2gR4ePi8icw+Jlb/
X-Received: by 2002:a05:690e:1246:b0:64a:dbe3:fab7 with SMTP id 956f58d0204a3-650486859edmr6868291d50.8.1775344221123;
        Sat, 04 Apr 2026 16:10:21 -0700 (PDT)
Received: from localhost ([2601:7c0:c37e:2360::17e2])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6503a73d18fsm4031828d50.0.2026.04.04.16.10.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Apr 2026 16:10:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 04 Apr 2026 18:10:18 -0500
Message-Id: <DHKR02R3ZA5Q.3GR6H9I5F3J4Y@gmail.com>
Cc: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <stable@vger.kernel.org>
Subject: Re: [PATCH] staging: rtl8723bs: fix out-of-bounds reads in IE
 parsing functions
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Delene Tchio Romuald" <delenetchior1@gmail.com>,
 <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260404223144.59168-1-delenetchior1@gmail.com>
In-Reply-To: <20260404223144.59168-1-delenetchior1@gmail.com>

On Sat Apr 4, 2026 at 5:31 PM CDT, Delene Tchio Romuald wrote:
> The IE parsing loops in rtw_get_wapi_ie(), rtw_get_sec_ie(), and
> rtw_get_wps_ie() check only that the element ID byte is within bounds
> (cnt < in_len), but then immediately access the length byte at
> in_ie[cnt+1] and data bytes at in_ie[cnt+2] and beyond without
> verifying that these offsets are within the buffer.
>
> A malicious access point can send beacon or probe response frames with
> truncated Information Elements, triggering out-of-bounds reads on
> kernel heap memory. No authentication is required.
>
> Add two bounds checks to each function:
>  - Ensure at least 2 bytes remain for the IE header (cnt + 1 < in_len)
>  - Validate the full IE fits in the buffer before accessing its data
>    (cnt + 2 + ie_len <=3D in_len)
>
> Cc: stable@vger.kernel.org

You'd want a proper fixes tag if this is a actual bug.

> Signed-off-by: Delene Tchio Romuald <delenetchior1@gmail.com>
> ---

This doesn't apply to staging-next.

Thanks,

ET
