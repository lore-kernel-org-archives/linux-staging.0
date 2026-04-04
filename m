Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2F10194C95
	for <linux-staging@lists.linux.dev>; Sat,  4 Apr 2026 23:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775344492; cv=none; b=TgC6m+vLWnRZjrKtgxUyA7Xe/rglrz9TsG7EVq6TtEXwdYI0LSlv3QGpfzJYBy+QQCMlXTuXY2uljLobUiHgf7rwpj5uEMx9Wc+JIpp/RE/ClsWbqvvjBEEUVu1X546I74eysGYJNEQ27+zGRwHqzZ4xZ3M3GClShKRlCGsqsmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775344492; c=relaxed/simple;
	bh=fKEcs7RHUYZ+YrPUGaxpiUx0Ao/tqo0DnKgDaoUiZWc=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=Ix8/T/x4Hv2PnnVE1I5DJOyFnwtXVTH6je9PrAYwG4+K3PgbeYV0rwQa6Blgt4vR5371mvdb7vVwQAqCYG+vlL5ZPYLJu+qDbxzHX+H/6slDjuB/Y1Skz6WYUzhUhxiIURCMNSOLta9tlcAF/MsTJReLdrUCOZcQrSQyaRFhCXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FsZDdQqx; arc=none smtp.client-ip=74.125.224.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FsZDdQqx"
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-64ef161129bso2353253d50.1
        for <linux-staging@lists.linux.dev>; Sat, 04 Apr 2026 16:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775344490; x=1775949290; darn=lists.linux.dev;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jUrR0i7q2QNv73SNpsilSqIp/Q7gwAlZF+cW1e3Grq8=;
        b=FsZDdQqx3LMqxQYVrfq0XOor9547knVH6o8TN0iT4kmHKnOfvrypVkzJWgacdLjvYh
         weLR1sFsfgSaczKIp0PRH6WgF/AyvieNqBMlsszaBMV2cGqwSm3U6FmO5NzjDzt6XqLC
         Plj04Gp+FrcMmqKZQtAW/mlvqvHwMzUFH3Oud5/MMnAHxzvDkQe1t2V3syB0ReDQA5nd
         UPvXpdQKS1XPNcN+FhYoLnv0i/la74Uq9KT4BETjsHqL4yWXLPJvTcw12o1CmUw+nW/1
         gP4VbB3lN9Bioo8w4ldl4AAGGUI5XIfpLZsgr5lYgZgfcZkzMKQuoyS4eTH90f/1EcQV
         gYKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775344490; x=1775949290;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jUrR0i7q2QNv73SNpsilSqIp/Q7gwAlZF+cW1e3Grq8=;
        b=NUufSdmryQecZmiDVmi83l36DYtGtIXQxymgqapuK5FFwGGxtgnoutgnPiq5bvXXmZ
         2dw5kKHfn3cNXIMCsXlm5qPb5iQ9lQV+vACSGXTVZjriVH3ax+qGp4B3QCfa7kTA/iRW
         y0ZCUdIXugvBUiU/xKIMqkeq8eWaXbktSxxY0GrkmgOZ8uHWd5sKsqbF/3bcnyw1voVk
         9gRxCX8aORYOLant57S08ce7aahfZ8dcTuQZCdX9h8zs0612YxzVbhKauglzc9N334Gj
         28IF69AVr/fCI+8Lb1QONnzRhDxumzwgoM5vjSXe0IeyNAYtgQ42ZJ8yekbFQ/pgrJLi
         U4EA==
X-Gm-Message-State: AOJu0YzKJAE6VoxXwOB+H5bPngRCT3sTyL+Z8D1m6QK/RymSuZKl0qe3
	swy+lLxMu59ST9Va9ltcLrYupieK5YxwWYydQNgdHaW/hBYBgbMEvQzCCQkRJitd
X-Gm-Gg: AeBDievNn5woZkrnIBhWQFRWdj0sMRLlKFkHo3Ztru2fhwCyAye2Ucd52OR6NibzcO1
	wOlGgZQYb/7IldsYfhsrkrf0XaAF9ilc6lzUzMAfS76lI/eGi/T67uBd4Ky3tzAaAgnBTY8GNbS
	q7rz3ixpZwv2bJk8RJ78+cIo/qr7/gaNgci/JaBqP5sE62hrxzc4nLn9iUurn514H5wDUxZ3Thg
	THR/lvjaj82mGBbGXQHCExuSfzn0MCbiKZwpjWu0/uRwDZkxHObTLbfe/GW7ienUWLVQmtmi8YY
	Hvj6OyBEaZyrCVmsDNYYEmlRsG6LHj5AxEVcpdvhR99x9zL9t1aucGzNymznW8GfW9gge8uDMGo
	VwjwHnp5x8G6q5iGqBtodNWyZ4SfT6xYL/LmFoxDtbsOsAULEXAI5MhSgOd6LqolF8ZjShvgoKU
	6OHvhLSCI7SE4YHgoEp7KNxyAvRDWsMnc8xms8/gMCEpQUuTDF/cYpXRgDy4JWu7Rgra7uHEbji
	fOU7cPdKP756/Bjby9PtIUSFhbYNh5w
X-Received: by 2002:a05:690e:1481:b0:64e:a0e7:2e34 with SMTP id 956f58d0204a3-650486870dfmr7177639d50.9.1775344489736;
        Sat, 04 Apr 2026 16:14:49 -0700 (PDT)
Received: from localhost ([2601:7c0:c37e:2360::17e2])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6503a978b7csm4079778d50.11.2026.04.04.16.14.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Apr 2026 16:14:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 04 Apr 2026 18:14:47 -0500
Message-Id: <DHKR3I6KLZWY.3VWMBF46Y41ZB@gmail.com>
To: "Delene Tchio Romuald" <delenetchior1@gmail.com>,
 <gregkh@linuxfoundation.org>
Cc: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <stable@vger.kernel.org>
Subject: Re: [PATCH] staging: rtl8723bs: fix integer underflow in TKIP MIC
 verification
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260404225752.61297-1-delenetchior1@gmail.com>
In-Reply-To: <20260404225752.61297-1-delenetchior1@gmail.com>

On Sat Apr 4, 2026 at 5:57 PM CDT, Delene Tchio Romuald wrote:
> In recvframe_chkmic(), datalen is computed as:
>
>   datalen =3D len - hdrlen - iv_len - icv_len - 8;
>
> All operands are unsigned, so if the frame is shorter than the sum of
> header, IV, ICV, and MIC lengths, the subtraction wraps to a very
> large value. This corrupted datalen is then passed to
> rtw_seccalctkipmic() and used as a pointer offset, leading to
> out-of-bounds reads on kernel heap memory.
>
> Add a minimum frame length check before the subtraction to prevent
> the unsigned integer underflow.
>
> Cc: stable@vger.kernel.org
> Signed-off-by: Delene Tchio Romuald <delenetchior1@gmail.com>
> ---

Doesn't apply to staging-next.

Thanks,

ET
