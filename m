Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FA53A41
	for <linux-staging@lists.linux.dev>; Tue, 21 Jun 2022 14:36:47 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id o7so27984828eja.1
        for <linux-staging@lists.linux.dev>; Tue, 21 Jun 2022 07:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=GJLwzs2N2pKacf0ZdpQ3Wu/SeO3mykpG6QqRYLAhfmk=;
        b=N6BE6BxVqA8S6MZ6jXtPrW+5fvbwqzTVoAHhh3M6wcy6Cp3FV3fMh6BLMAvKVNnIfu
         N3CoCOxglGEajhXHoucNcwECSyZ/r+5cwTJu0HYMEaNbYQEZAXIf0ZLUR3VVuqXCKy/M
         +cPfNworLHTQ6NGyNeJOo4OYiEmoloxSMmG7tq/orOseY2bXZvl0/T7T3dv/VDsT6jP5
         TF8L4ho8OddkWkPEJ/HtUuM8JU1NqfqYsQpQdrNW+1GuxdhOSAKbdjT6TtYj82lAIH68
         avk9dDAYHsqPI4Kwg6aZPdtWGSyJDDhDzeVgox8yE0RAvGFjz6ykgpn2s6NlcobiiEBB
         LnJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=GJLwzs2N2pKacf0ZdpQ3Wu/SeO3mykpG6QqRYLAhfmk=;
        b=ivquWSIKouf+8GXPH2zsruDqfnDSR85jkeInvC/GArW7hV9bVcoi9hLJMz0FMsxdZO
         NdlErn7vANWxJuKu9IA9vgStWy034h8h2PS9jXkfG7FDi3cLwNmxKVtTzgeeX9duDWzl
         3Kp6PpqULkTlLHC2+h3rCmOehYdDpBXbBNM/mihZrMnv3LIylhThZisI46TsvlaC+LDL
         m4aTKsUFoxaBKq2GPzpI2KueYcazU7U73eCTfrtH0j2UAq6C/ODOaBzIpov7gQ4Tf1kb
         4VCgKYX/VBwH1xY9nfmQOv2DYUYKHozCoIbA0cHScBwQzQa8KnX1EV2kldG1bkE+h3Rn
         9K3g==
X-Gm-Message-State: AJIora/GzGVv+e4mbILka2nXyCkiMzYXAEy/c7B1j9+LkLL/0xi0NKkM
	jknMRqs5alK3scIgquEa/SpmiRhMvNam5lrC+oU=
X-Google-Smtp-Source: AGRyM1sgOphI4tXDIE/cP6e1t4c0owyLW5pNlViUlFMGQUq41Aw+paKFZiYauH2ZneR1k5TX7rpbx+1VF9WS4NhuzOI=
X-Received: by 2002:a17:906:9b96:b0:711:d21c:1b0b with SMTP id
 dd22-20020a1709069b9600b00711d21c1b0bmr26352742ejc.365.1655822205405; Tue, 21
 Jun 2022 07:36:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Dongliang Mu <mudongliangabcd@gmail.com>
Date: Tue, 21 Jun 2022 22:36:04 +0800
Message-ID: <CAD-N9QVVKUDFKMSxUc-smcz0B_7PrjN3DPku+cDM3ZKDn0XLBA@mail.gmail.com>
Subject: Unitialized Variable and Null Pointer Dereference bug in gb_bootrom_get_firmware
To: vireshk@kernel.org, Johan Hovold <johan@kernel.org>, elder@kernel.org, 
	Greg KH <gregkh@linuxfoundation.org>
Cc: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, 
	linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi maintainers,

I would like to send one bug report.

In gb_bootrom_get_firmware, if the first branch is satisfied, it will
go to queue_work, leading to the dereference of uninitialized const
variable "fw". If the second branch is satisfied, it will go to unlock
with fw as NULL pointer, leading to a NULL Pointer Dereference.

The Fixes commit should be [1], introducing the dereference of "fw" in
the error handling code.

I am not sure how to fix this bug. Any comment on removing the
dereference of fw?

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=a4293e1d4e6416477976ee3bd248589d3fc4bb19

--
My best regards to you.

     No System Is Safe!
     Dongliang Mu
