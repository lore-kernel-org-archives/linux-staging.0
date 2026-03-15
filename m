Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 607DB17B43F
	for <linux-staging@lists.linux.dev>; Sun, 15 Mar 2026 01:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773538686; cv=none; b=SUBV+k5E9IV34qNY8IWWvwG6PDIJ9J9tZ6tuyiTuK206sJFKuh1tx2ukSWBkEeUIxeSZgAKoAV6Abkg1bK0RL8Qa6A3krIYhrNSwIowHt6lbDuNRs+w0BD8XIn2sfZnYQ3q35YTZ4a3asVegcogQSlpeQfvUkBGpkojXAUIxvkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773538686; c=relaxed/simple;
	bh=LtFFC5NhjWrXvJbf6Z3+Q9b/oXRQvNHHEOpLmxcsu+8=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=X66FTd8Aws2KDC00kK3gvTxIPiVEjoksXiR63Nkbrn4boRZt7biaHbylbTmAasm7CLTzm+Rg1+x8FpE8bgoF7uYAnq2R+0YXwY1OvE1aJBdw4oWyBbj9lA/x42Ny0zbs7yfRmvKm41hPfWfEMwVfN+odNRkppkXkXJIyeqewRTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XALfNHGF; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XALfNHGF"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-829b2019b39so1844133b3a.3
        for <linux-staging@lists.linux.dev>; Sat, 14 Mar 2026 18:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773538685; x=1774143485; darn=lists.linux.dev;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LtFFC5NhjWrXvJbf6Z3+Q9b/oXRQvNHHEOpLmxcsu+8=;
        b=XALfNHGFCo9T3CkXONMUAdWFeQZ9wHsNUPRpZXXNS+2QIvWJxoafM/R+6o2Oj1mW9X
         /hWts3MQjb8T5nskaA0mCLZbmoHRzx+k35tBPJBPHvii8OEv02VD2K8uWVXjJBzNecOb
         G7Aca8h8n9iNx0J+D5Vf3GCV9yhoH6N0IyJMlGTOqwkqbnLKBLskaT0Aw7/mrf+5WzcC
         iD2RV9Duha/4aolHXLO273hy/hz03Po5YhDYsDHqlXTXK2m4snfpU8p/KYsiR4oDuCGi
         jnxnQGdPR1nni8DTv7YPVA3RhTnR5wKgL42wsB9F67Y7lWugy6Ek1WnX83/olN9u9Mpw
         +6kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773538685; x=1774143485;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LtFFC5NhjWrXvJbf6Z3+Q9b/oXRQvNHHEOpLmxcsu+8=;
        b=pu8vlify63k1ClnNW+pFK8yf06UUKGBmkzNB0jDlnZvLr9VyYaoqRF7X1EKDMO+/wP
         oSklYyfIftXKJ0lKmrLj8cEcXEfGIUYVAaQeHGUKiGzo2W/18eEIezY9x47CAVIhn/7I
         w7a0NDMLVWiDOBfvkUT+cniPsdA9w+TwVcKM7IrM0mmOx9bs1IXzur3EzXSbS8A2xp8X
         B3ahfE+FM/hi6SD9Wcr/tsdI4CMNIzxbs+4H7gtX7nzcVX9U5hhNlu0Uw3SzjJMJGw2i
         j0R/OLuR1rujXAOdsXVLYlSlHsb3kYjQo06tq8ZylW4538xS9zBNvEn7PURztF8Ejgek
         7OAw==
X-Gm-Message-State: AOJu0Yy7+gEnufVa3CxXrn/M+UYL6IPborSZAhVm3iW1c2n2NyREKTh1
	u1T5OwxarHfwLI1tgAJHOildXTHh9vpdPOPwC2viwWpG6kHtmbUvtSiu/Rt+D/Rp
X-Gm-Gg: ATEYQzylN17WOhpGhWe/gi5TMJTBCp6frYDfLiAGK+vi04Kg7vnR+4c+2BFz+E9ughs
	UjdJt+ZAc6xjWh3MEWCnqQvJry6Ar0d5AI52kNWSMviF7WahnsgNWp68BQeMonX93iY8euZMBFK
	VXX8/4b6D7vDd132JD2clTgthe4tyDVO1pUyeY9SSKt30/rgoKK7KDAdot8DZLiSqXPePEpCvkc
	yqXwoEPfgnroN3dwqXJKgepagPFkpQ8pCXp0c6z9NYkTc6Ot5Q3c9Dxp0uG2NZCMp77SQVbWO+C
	byaahogBhbYUEuUjPoeQUuZq2U2i+/LF84FTCJxIheOBSwT+pO6FJNoLtypcyw+zNKNo09fs7GF
	fqU8gBrsRMxiRyv8fiOOF0HPKE/J18tqqzFpvZP5mFrPXX1EscnANVkgKiWx/zt4A8bgod43oUf
	V6BjkD9lYEsqve1tg0TOBWRQNgIhKQ0Ba8HZaA8vXl+wHXKSXHW+glW7NV3Y+9KbemQtlmRHNN/
	cM3ra2r7lFMZa+YYKCgCisy13KCJWH7sGvzb4l1/ok=
X-Received: by 2002:a05:6a20:d80c:b0:394:5d0d:9217 with SMTP id adf61e73a8af0-398ecce84bdmr7252773637.44.1773538684710;
        Sat, 14 Mar 2026 18:38:04 -0700 (PDT)
Received: from localhost ([2601:7c0:c37c:4c00::5585])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c73ebb64819sm6125588a12.22.2026.03.14.18.38.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Mar 2026 18:38:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 14 Mar 2026 20:37:43 -0500
Message-Id: <DH2YZI1OV160.2SICP8K3JFNX0@gmail.com>
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Marcos Andrade" <marcosandrade95963@gmail.com>,
 <gregkh@linuxfoundation.org>
Cc: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4] staging: rtl8723bs: remove unnecessary braces for
 single statement
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260314211303.43030-1-marcosandrade95963@gmail.com>
In-Reply-To: <20260314211303.43030-1-marcosandrade95963@gmail.com>

On Sat Mar 14, 2026 at 4:13 PM CDT, Marcos Andrade wrote:
> Remove unnecessary braces for a single statement block in an if
> condition to comply with the Linux kernel coding style.
> This resolves a checkpatch.pl warning.
>
> Signed-off-by: Marcos Andrade <marcosandrade95963@gmail.com>
> ---

I'm not sure if Greg won't mind the v4 isn't here, but since you caught
it in a follow up email, this looks good to me.

Reviewed-by: Ethan Tidmore <ethantidmore06@gmail.com>

Thanks,

ET
