Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD7B808
	for <linux-staging@lists.linux.dev>; Fri,  9 Sep 2022 11:29:56 +0000 (UTC)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-3321c2a8d4cso15369997b3.5
        for <linux-staging@lists.linux.dev>; Fri, 09 Sep 2022 04:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=7Jo9u7GazJ+NBxWj7pityHgzrKi8PfZunYuslMS0vVc=;
        b=NTTtBLGGL2eNQYdTb+zzpdTYz91YLvxK1ithhO8wg2x7oYFaEm66B2BmGfm/Y8U+43
         in5FuyQwSxzoUECDy0A8wniORIB7Awd3F8wh0EBJ9IUIN+IH9E8pOEPAZ7yb1akOue3R
         UJFHD7AUv1dkh3xKoBLX8TTL5/MkfJlO4Vc2m1FwXPcE1j0uEHWFL/0DSJAVgDde2vzQ
         jgBbWqi+zWSGenExXq6eY++zOJ7QKoHPQg6OrKjnEjW70uT9zuU2R33rPhTKiDUCPTYy
         cbMUg+9qN7U/LaBC0WyxKja1f3v5YqcVpIoPhjM+0RUr3wfnv/1zBom8ERWDJPIq+dwt
         cK7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=7Jo9u7GazJ+NBxWj7pityHgzrKi8PfZunYuslMS0vVc=;
        b=UEoM3Rvs6KvO/x6ljRQ2dAV2OWWwIJjz3HOCs/0OHiAbhAr86SE67nm+IENkZPPusA
         ZxP/lKq/hAbw4OtfkwKkjVW2i71lnMlVp2RvcJRqdysgQoaTG3mNg0HyibtxtflLZKBy
         GN11gTM9ksvpPUJjyVqJfnRfK4QO7fOFc+JdNuqp5eTDLOeyaKif3lRq2Wz4GCk1dLIZ
         4ov4EXTRp6h0gsO2o2tR0r5re1XhivnfQ9/d8qYZkIhFe2k9FZx0toWeMU4T7oFfbgEH
         ugypPIV+MGwDj7WtvWtaENP11dEFCdLY4+EVvuiHE2im8g9tNFePDSNkK9fsV7kjtf09
         XphQ==
X-Gm-Message-State: ACgBeo0phkzudGOMTSTcRz+QzUbknNujbnpvrXZ22sQhDr5b6xU/qknj
	UkGBsSD4LXDBFprc1d6JC95rVGYVQ85HkdqWv7A=
X-Google-Smtp-Source: AA6agR7R/MfNjORDcoK0lXV8t9RFQrHqMpfxnNtsIcBc0iADkFWIqulpYuzSrOkBm+WbCLdZT2CBm9jTCmRaPNMnxiU=
X-Received: by 2002:a0d:ee01:0:b0:324:d943:19dc with SMTP id
 x1-20020a0dee01000000b00324d94319dcmr10912160ywe.325.1662722995847; Fri, 09
 Sep 2022 04:29:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220909090856.18427-1-namcaov@gmail.com> <YxsUEUqbKRW85Z24@kroah.com>
In-Reply-To: <YxsUEUqbKRW85Z24@kroah.com>
From: Nam Cao <namcaov@gmail.com>
Date: Fri, 9 Sep 2022 13:29:44 +0200
Message-ID: <CA+sZ8B_XzDO8pgFJLMzObBMo6KYHeYsttfYNoSUi+CGf8293xA@mail.gmail.com>
Subject: Re: [PATCH v2] staging: vt6655: use memset to make code clearer
To: Greg KH <gregkh@linuxfoundation.org>
Cc: forest@alittletooquiet.net, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 9, 2022 at 12:23 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> Why do you have to cast this to (void *)?  That should almost never be
> needed.

Because I want to suppress a compiler warning:
drivers/staging/vt6655/device_main.c:869:9: warning: passing argument
1 of =E2=80=98memset=E2=80=99 discards =E2=80=98volatile=E2=80=99 qualifier=
 from pointer target type
[-Wdiscarded-qualifiers]
  869 |  memset(&rd->rd0, 0, sizeof(rd->rd0));
      |         ^~~~~~~~

Best regards,
Nam
