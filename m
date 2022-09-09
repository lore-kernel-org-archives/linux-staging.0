Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9377A64E
	for <linux-staging@lists.linux.dev>; Fri,  9 Sep 2022 14:42:17 +0000 (UTC)
Received: by mail-yb1-f181.google.com with SMTP id b136so3011330yba.2
        for <linux-staging@lists.linux.dev>; Fri, 09 Sep 2022 07:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=6lhLlhxfOjgL1Bth9mcHIlbp3cpWG9g9ba2QTnmM87s=;
        b=MuhQoyzRTIr3sfU/R4tTPiPkiQTsnKI3UW/13xM3MteEEpI551whUSdSH412BQuKJK
         iU72F+nL8NcYglUCNx6A46k1JZ2tCh8GZQ1ISveNfPYBuaavJPBoAWmo1ehKLq6cH9wZ
         wb2YWKAyx+07CoDHzFr/sg5AiB2a6XAPL+TOICqjPRqtLm4vzMyf2gVLrtDOhCtpfEtG
         JoQ4Cm899e6YsN1HzPfKltu49VsE3ILRCdllduAZ/wJQ4i+39TIgqogMyjh9tytNTUUB
         lH122hho5jt8tc560VsFVoIxwTfpoOTo30C0ZFUiY0GN8hoI0/KdT1wB6ZH47KQ086+e
         sEPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=6lhLlhxfOjgL1Bth9mcHIlbp3cpWG9g9ba2QTnmM87s=;
        b=jeqpYXxg749mHvdgjGBCZ44AlGVQA4L9VZ/qaSO3tySfCfNtSKrcB00hmTmdYoCZkT
         gtQTKzBp9zlArECtkNzuWk8pP+Yb3cpsd7Vuc/6o2ctLqUfGkWbcS5s4IDZ66DPuyu/Q
         3EcYvCK/HUHz1O2KC7ig+Ms0XBygeiZOCvWHfHCsCLQHI5SHXMxuY5SFvXJ7XR9NoUyd
         35IVMrAskQov2ySpk9gFQe+LZcnHAdzhGtb+Izfe3s+iX6/pfMzw7Fyzfp0wkSgR4Ogp
         WGTOE13unCE/feiEwdC+hvEblsbW1tsSAjBdtDvG6H2rEvA0+sd4vEjezmAEdg8N48dH
         TuQQ==
X-Gm-Message-State: ACgBeo2eO7FdXnko6YVRwV5IPs7ii78az6hgVJeOykFWMrMO2CeN/3qB
	BlrkzgAswjlOWC6/QMJzffEwOcpToHc3mbqb+oc=
X-Google-Smtp-Source: AA6agR5cAeL4piPIDucGy46S2CIUgkur5XlmECL36enKIRCoOp/YALb/1m0B+JGkf0xpPdbqS3QgtCRqFWq0yopeAtg=
X-Received: by 2002:a5b:c92:0:b0:688:436c:b2b with SMTP id i18-20020a5b0c92000000b00688436c0b2bmr12028529ybq.436.1662734536565;
 Fri, 09 Sep 2022 07:42:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220909141338.19343-1-namcaov@gmail.com>
In-Reply-To: <20220909141338.19343-1-namcaov@gmail.com>
From: Nam Cao <namcaov@gmail.com>
Date: Fri, 9 Sep 2022 16:42:05 +0200
Message-ID: <CA+sZ8B-z7nRdJLhxeJ_tWSj_LBSwoFgtQja1-vDnBVdR=b0=DA@mail.gmail.com>
Subject: Re: [PATCH] staging: vt6655: fix potential memory leak
To: forest@alittletooquiet.net, gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

I did not realize this initially, but this bug can cause more serious problem
than just a memory leak. In the case that kzalloc fails right from the
beginning with i=0; then in the while loop, "i" will wrap around and the code
will access priv->apTD0Rings[4294967295] which is obviously not good.

Best regards,
Nam
