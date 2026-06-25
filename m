Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8FE8385D86
	for <linux-staging@lists.linux.dev>; Thu, 25 Jun 2026 10:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782384536; cv=pass; b=cYDhzXG12AO5KF3tS5yeoM4Nhg6e/Ld0T4opaHXPoWhRbZeFwaZybAxwJTYx7fpW7hYf0i7U7c9tZVhO3hr+En36+CS5Y/s3l1avCJ7jwyxcoas7b/GJHp1ZgXj/FnhbjMyr09fd80I7Ug4V4jaudnEYasX/vvKm25fOjXvtGdE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782384536; c=relaxed/simple;
	bh=aqqNBAalkqD6muZyC0O6VQ8Vd1WXA1z5tSn2SO2donU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lawF0r0MpP8+OEKPK1rKTgpdNyJmrpcAaxaY0vZ6z9AFcRRsbwdPSf2yYhjlxPXsN0WqP0WhMKv6pWgDJf/wskQRdsNFSA7D9v3w8913cMYzpSTBTNqyuzKmik0qZCmvBYH8mjtbmEop6AUO2Ud0I8u/9lOlcE2jB+wXa6w1X4U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IMIWygzR; arc=pass smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IMIWygzR"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-37d4ab2e7c5so1844898a91.2
        for <linux-staging@lists.linux.dev>; Thu, 25 Jun 2026 03:48:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782384533; cv=none;
        d=google.com; s=arc-20260327;
        b=hBXrVqWWYe9Vhl+7WaXOgG/LRZmi0jeaBWmxQWWna4tP9Hdp7WTDshveSkp8KSf7Et
         XhWqsRv6U36NRUS0B2+H0DXBzWgIh7w8pS2KMnsFrOPt36n8tMSYlWwn7WRoSbuC/X4Z
         RODd1hJr9Ix/KsiwNhB6mHLTTPb3yIQCLW0zhfYHTbZ6mGNONEn+0E4RWJ25D66GsNd2
         AXxPWoo39m6RIkbS8cjykGNmrU1Mq548rehOmNE5k0I1wng6bBCgzxbx/b/0MTHyDDTp
         KKHPF1vbwbg6hgwXqRhHU1XKXja/4J5yjmZFihTt85n9bhEM4RZEcQ/KvTBXU9wWPp67
         cQdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=fOyZJpvkK9c6YUH+6yW/0pZKB0lcS46pnNEEZIPm0yE=;
        fh=62WWdpAG+EYuX8V7X8nR5gra8C6fqxTiWNKArMthSdM=;
        b=KhgKQIj7uCPxxPcIdha9n1Wa16LHnPRhy/NSKa5mciaLwHCJgy8ODe9zFvoFCostBk
         UyFQKofF7yDQ4bmG4P31wO+6XIyjGpUfAOg6HS5y3P+x+Q/dSny3GM83PQAV7O/cwTOC
         WpuuuXbVFvCEgQPBxBJzVS9vvYZM8kf9D/Nh47HFIdXfeX3CWFecjXRscYzXEPAr6WI3
         QpflBoskrj+/TDAO8oTnx66sqLxID/j0Y4gztBZM2Epf3sTKU76ryVcx1irf5qUi5cXK
         nFnkDZ4IZlYNBB8lMxHQ1bSaC1Rr7FXlqe6HyoE4ATYFHZZcO0zbG7z9SnDJW4h8WDKh
         zpTA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782384533; x=1782989333; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fOyZJpvkK9c6YUH+6yW/0pZKB0lcS46pnNEEZIPm0yE=;
        b=IMIWygzRd+YJpcymEyOhgY+i8cXL2Io8VZw0OUrbRpmCbnVqm/dTD3DLN5+bOP0ozI
         tnLG+db4b0OSbCUCZzyXQ/l0B3osqO92Nu+57vtD29tIMzhVe0MrP7EcMuZOwVno3CVn
         qCZmu3wrsqgbt/5piBmoEeo/8OQnSkJTyJ4S9pDkFQU2lBw0ulcgE9vv3QwmWUJwH2tA
         dE9IwZGP5uFnctx0K1oI4jGrhKCLRg7fIpIwi71iXP14/N9OU+CGI25TR3e6V2ChMwDs
         YIci1kT3fbopL2Uz9z2lErAvoVU1uYI6zDJhtNwad5RQ8gkB/yASnzWfMC8mQOw5wX+V
         rKkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782384533; x=1782989333;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fOyZJpvkK9c6YUH+6yW/0pZKB0lcS46pnNEEZIPm0yE=;
        b=qtVZ5HN8760Ma6PyD3ooaijsyqAA/JbU+Q1OloIf05wIsYTZ6Y5pfZxnEoEaIiwEpX
         hYysGBA0yMaTAFqgrJh5nZRUqPNzXCEG31GeRs8/jtRcy9k15tCHtyeB8dWKL9poIxJO
         lUXCsLQID/geCbUJAASrXe2jbkjMkKxsom3BbqACDTRMSmrIoTXIo55S608z6EMnNJX1
         nvWxyqI6akpQHM+hu4WwasO/rdEbc6HR8X9iV0WfX30qZBfN9QzaCmU8UW77cOARIjGn
         1zvcpFrnz+cCNgtCujnH9diL/leLLkXpGw6W+LaBsynDxWJ+yRb8aZIye9O2rQ3MNV9f
         z98w==
X-Forwarded-Encrypted: i=1; AFNElJ+brvRqq6DmHM9fq/qURJAM6Ir4oy+JFidpy1biSoFT4rqIEzoMJHgNKocJzoewHjnMcEEIZFct0RDpqJt2@lists.linux.dev
X-Gm-Message-State: AOJu0YwEttcmiwkKQxgnoj1ZddFqabKO6/KOVKEN5R6yMWFb8/JPtswS
	ZtgTv3oG216IluQe8nj9mLbDqKN1gXfPdA6abOxt+Kkyc6BKa0cj1m2AiP03qM9saeMCj1loycR
	K3j4zYKrdrxZwtXIZAjk8uHvihaQb9z4=
X-Gm-Gg: AfdE7cnw/YLxYDidhnj0ZmqWLsYgE4bMkone0KprpTTFNHgnOV4+BSgSR/4sqJvasr/
	9LLPz/dn0EdtAfRaXJ/JKMQ20v+A32QgisW4Vby505UVBkwLBEd8ew91xd8/k/7wkTaQ47jLSUR
	zynL8IBv15yApF5wGZxQIrMgBSjVu5iJi+qDgdKurHPgVm18dO4tlu8vLhlvuBWpF0FKQrWDAwT
	HtJZAnZydCz7cczu3RriOJL1PWvS9jaMIXOc59MtdCzj6WB4JXzPMhdS/TLbAzStryS8lBN/kQ=
X-Received: by 2002:a05:6a21:8cc7:b0:3bb:21ad:40d8 with SMTP id
 adf61e73a8af0-3bd4afac2acmr2548789637.39.1782384533218; Thu, 25 Jun 2026
 03:48:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <aj0CZOUlYlJydfPd@stanley.mountain> <20260625104520.288129-1-suryasaimadhu369@gmail.com>
In-Reply-To: <20260625104520.288129-1-suryasaimadhu369@gmail.com>
From: Sai Madhu <suryasaimadhu369@gmail.com>
Date: Thu, 25 Jun 2026 16:18:41 +0530
X-Gm-Features: AVVi8Cc5U98wZEWYzEL-OYL9MLZi64VyAKRJ4CmSJGMhEvyDrepjdf19Q4WbLCw
Message-ID: <CAB0uMAcY8xEm=hVAt-=PHDamuQAMQia9aCxz+Nc9PbcQkeq25w@mail.gmail.com>
Subject: Re: [PATCH v2] staging: greybus: add comments to mutex declarations
To: error27@gmail.com
Cc: vaibhav.sr@gmail.com, mgreer@animalcreek.com, johan@kernel.org, 
	elder@kernel.org, gregkh@linuxfoundation.org, greybus-dev@lists.linaro.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

syr for duplicate patch,
please ignore .

On Thu, 25 Jun 2026 at 16:16, suryasaimadhu <suryasaimadhu369@gmail.com> wrote:
>
> Add comments to mutex members in gbaudio_codec_info struct
> to describe what each mutex protects, as recommended by checkpatch.
>
> Signed-off-by: suryasaimadhu <suryasaimadhu369@gmail.com>
> ---
>  drivers/staging/greybus/audio_codec.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/staging/greybus/audio_codec.h b/drivers/staging/greybus/audio_codec.h
> index f3f7a7ec6..326770b99 100644
> --- a/drivers/staging/greybus/audio_codec.h
> +++ b/drivers/staging/greybus/audio_codec.h
> @@ -70,8 +70,8 @@ struct gbaudio_codec_info {
>         struct list_head module_list;
>         /* to maintain runtime stream params for each DAI */
>         struct list_head dai_list;
> -       struct mutex lock;
> -       struct mutex register_mutex;
> +       struct mutex lock; /* protects module_list and dai_list */
> +       struct mutex register_mutex; /* protects module registration */
>  };
>
>  struct gbaudio_widget {
> --
> 2.47.3
>
