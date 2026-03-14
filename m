Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 438401EEA5F
	for <linux-staging@lists.linux.dev>; Sat, 14 Mar 2026 21:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773523061; cv=pass; b=Dqd3SO12vizaQ50BJ1yWmi+TP92GWsXU5lsq6MKuMc+FZuHpWEYvPuTjVwtUr3ZayyBU5ekz+Rx45Wlmlh8HNw4+zu4uT5ED0vHjG843sFKnFnzYiS8fjobyfxNYl9CXxB0EYA8w01ZV7mFm8tFgRXVITGPxaW3YGoHr5Abcils=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773523061; c=relaxed/simple;
	bh=zinEHlSChiERZ3sFGoJwrbZQuYmBmgFKlodp1P95PKg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OA1MnpHEo2SO+o+i3TKWsGdifJHYa0VGL7o8ponB/b3c/nEgxvXnH3s4P8wjP/28VUvJJmW7WmA9RBNqjvY9l8UTCO6zeQ0zn31rHYQDDSW8D4ZD8k0WdSqc9XTc3DZazxZGCgggMknwo9KMU3SFOuk/SWD3ft+tGQACN5qUlFs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PY4waORj; arc=pass smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PY4waORj"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-89a0ece9f14so40640046d6.3
        for <linux-staging@lists.linux.dev>; Sat, 14 Mar 2026 14:17:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773523059; cv=none;
        d=google.com; s=arc-20240605;
        b=eLzeQlUdygeVITOdwMgu3IFkF2hSvjY/6BOfBjuDF1fIm1QQZuSm4Ht7enOFVg5Y5t
         2kYPZOpmdi6S0jiIn88zEUPN7paf8gKJO1gvHZw13N/u4GnzBqG3SYbA9djBVhpzlIor
         M4aIInHenOOVNHFuo9PfIzikp0qFMRTgWH3+iEZ1UTKgO4+llhXFGVqOfPO4ebrJny+q
         CR5pitBtbdPLvsVxGjwBao34Xz/0M30ZKdy12M83pTlB0erItq/t5sQGt7LLZ3evozyB
         JJnyWMR8q95uyL0qOYYHprxVCOc/FVf7854WIINkEYmuWgikxVVQSQ80JMYn+x9tcpKC
         cX9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9uiBcD4Owtsx07HUSLeRHjfMZNMxqZ0rCe25QoNCIuU=;
        fh=OGuGyImkAcJwt+sRhpXRgKfXKBxNQnSga2zoz3XK8eQ=;
        b=ezjCY7aVL40rdP95j4XNzkkH+D1hp0aJ3MxWRKAiws3lhKAdHhgKn0y1tTyv0l/3Oc
         /dVUyIdS7n7qV/GXQHPh38LGzp0siPFnUjOY71hj+p2+/8IxZwErozOsg5V2ZnleY3Xt
         tshjDIY1yGUF5dDC2S6laOhBytsRsTglnktMFWtPFqxFGF+R2YLRuO/UQXmIYVA0eRn5
         M2VvBqKHUeEE2FLiM0l4amDWRD5OI+AC/qdT1D5UJPp33foJhahTD6l3D6/avLvKOj1n
         psZBard+c0K0QUqj9ExgZ28tATATyh0vGtvjbAFJ69mVgckkRJJZv7jmYzTTB9yd+a0l
         DNAw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773523059; x=1774127859; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9uiBcD4Owtsx07HUSLeRHjfMZNMxqZ0rCe25QoNCIuU=;
        b=PY4waORjn5386EPTrIptOCxpR+hE4gahu/bY4RtAEX829WRRH7lSvLuk06KD80gjCU
         aIwxyVHvgPk6ij8ZKox+DJQZhmSsD75EGuE743Iys60YbDIucSh+NIqFNwZMFAuLy1iD
         cayQJSfjgvxWYEie2jxeSUh1V4SvTOVc1TgExXsMSDVQooAaGxfbBFS8TYG5E2ApFZOA
         jgac6lrMEWCP5HRWNG8QDSONgBzh3g/v97pqOf4zsVO8RNMDrkdRBmkqCvTZtqS/0pAD
         ojaN3dKhsL3ao735IeJQnnY6MD2oznGMWdwfsccwNH7JoDfnkIPFPTgtU7DtPjjAy4E5
         eHbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773523059; x=1774127859;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9uiBcD4Owtsx07HUSLeRHjfMZNMxqZ0rCe25QoNCIuU=;
        b=LcIfLMfA4vkOeu+vs4THOupbpeK8zxg/+wXvwfgeYbx/5oObu298sE+BgkMOBXyJMv
         QaQgimqb0jD9dONXs4lzWuG7v2wkNKX4rVAelYWNXhBy7KNx/G1k3zfEzhVl/GgoyI3X
         pMF414fFkxsOzePzENNAM23SmdEZGaaob9zGcKh9YI8Fdt7qiUv9s1QFVkatWR4uuc/t
         paOLBVij0DUDHy/LriXpZqnekNGC76kL6G5Ab7sUmsn3KpWd/yokwsLbD1BGVu1ecngT
         NmfCkLXNhx3HP/lu9dX87mMBtJRgWrLZ4TJkYrPxThmerJN8/7xDmKWJ2ofvugJupD6c
         6sjA==
X-Gm-Message-State: AOJu0YwSiMGpbbRCi3CeEL+oGCAT4ICZ0LKn96oiXgrtM6x6xrZj/fcw
	XNlL+WNDOnP+XxQ1MUX53QxDHYHGXXuZQFRgr0nltVnnZ8reYlHPOgzGSj9B4899ZCg7Im+PRr1
	wsmmO12R2z4DRTb1OSKSj2RGaNiI5rAw=
X-Gm-Gg: ATEYQzyMQy3D+i+Hx63M45c3ZbukiZCNZZ1SLJcvfWTCex5249ikWgF/nrJJmiKxaJ/
	1sDFB6T+m2YQV3R4nIsaXI7hyV28Fg+8Xfo1A38HwLl6KeIbqm4QdVmQ+lk4rGDS41HPP2ZUqdi
	6uZRNhLRaYJeGRhF1JIeIgDWX254elRQWaFfS2Y7Ad+qUmkZZa5bMMU5Xe68BciOkBzOlc+JMe3
	3ou/5TYclqC1MczoPIC26q2uYZWgMT+ngr6VS37GmGZ5AcGqmljG5eMfOag0aGOAFDo65tMeUo+
	xLjpyh+N
X-Received: by 2002:a05:6214:230b:b0:899:ea8d:52c8 with SMTP id
 6a1803df08f44-89a81f72756mr116834066d6.43.1773523059220; Sat, 14 Mar 2026
 14:17:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260314211303.43030-1-marcosandrade95963@gmail.com>
In-Reply-To: <20260314211303.43030-1-marcosandrade95963@gmail.com>
From: Marcos Andrade <marcosandrade95963@gmail.com>
Date: Sat, 14 Mar 2026 18:17:26 -0300
X-Gm-Features: AaiRm52GXcuO_Uuhj7TGngwkvGNZQZjaAFrdG8xz-xof43PHvSiiYhW6o9CB2O4
Message-ID: <CAPMYNsxtaeEvOmRvo3mQ2gCC10FjdA_8x-xi+je5yP=DcLMbCg@mail.gmail.com>
Subject: Re: [PATCH v4] staging: rtl8723bs: remove unnecessary braces for
 single statement
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

Apologies for missing the changelog in this v4 submission.

For clarity, the only change from v3 is the correction of the typo
('checkpacth.pl' -> 'checkpatch.pl') in the commit message, as
pointed out by Ethan. The code remains unchanged.

Thanks,
Marcos.

On Sat, Mar 14, 2026 at 6:13=E2=80=AFPM Marcos Andrade
<marcosandrade95963@gmail.com> wrote:
>
> Remove unnecessary braces for a single statement block in an if
> condition to comply with the Linux kernel coding style.
> This resolves a checkpatch.pl warning.
>
> Signed-off-by: Marcos Andrade <marcosandrade95963@gmail.com>
> ---
> Changes in v3:
> - Add missing change log as requested by GKH.
>
> Changes in v2:
> - Remove unnecessary braces in os_dep/sdio_intf.c to comply with
>   the Linux kernel coding style.
>
>  drivers/staging/rtl8723bs/os_dep/sdio_intf.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/stagi=
ng/rtl8723bs/os_dep/sdio_intf.c
> index d664e2549..a86252cca 100644
> --- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
> +++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
> @@ -146,9 +146,8 @@ static void sdio_deinit(struct dvobj_priv *dvobj)
>                 sdio_claim_host(func);
>                 sdio_disable_func(func);
>
> -               if (dvobj->irq_alloc) {
> +               if (dvobj->irq_alloc)
>                         sdio_release_irq(func);
> -               }
>
>                 sdio_release_host(func);
>         }
> --
> 2.53.0
>
