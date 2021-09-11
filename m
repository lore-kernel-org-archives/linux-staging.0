Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D3B23FD0
	for <linux-staging@lists.linux.dev>; Sat, 11 Sep 2021 05:08:30 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id b10so1853146ejg.11
        for <linux-staging@lists.linux.dev>; Fri, 10 Sep 2021 22:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=r5V+MDoRWlx8/8wcbn887d0lwujieIftavavZI/Ebz0=;
        b=GsDfGdrcCM8ze+bKWXuYnLxMS+t6rJ5aryL7Fm6yMFPEgmnYsoWCFLKbXaVnppZaAH
         JeVS+Ri6YkqP13rX8txtBixqa55F9tAnjFI6uRUt/TzG5+5NvX425yFAxy4z+LhXds6G
         slTFG0ZNwaIIbpfO3aWwlDqYR7ePNx1Rxj4NsYo3sNGiyssrIB6UYxOekzRQd57BnR60
         fcapD1SynXdAy3ZsYcSOs6QU1RjPchLR6QkbQthANEie9oRh1mL49fwaKczRWds6chcn
         KlvMzhex6D8eOSrD/aRRXRVLHO+edylOuQ32udU8sL1DnFGTLASnTefAhnzolA2Gh1qK
         //wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=r5V+MDoRWlx8/8wcbn887d0lwujieIftavavZI/Ebz0=;
        b=E12psmzhhwNGycyfuukrAGcvyDIKnwpzZr8AyETeeeLZymWFjYm7t1V7Gsf5jnMsWv
         9VGT+Nn/1GtiGodnSYWxIDIcZdZALhQ5RO6uRYgkJadwRzAichgjQ2ihXB/t6gAF2vn2
         vF1v1yWmYns90hC4dqsVrIud7TE1w0c6BxzSTNori0pc0yUQrZ7E7KY/qbWfrEjKRIyp
         EMDQX25Hvw2IO0+NV9JATHa/g5f10PV1bpjGNms380dqHRSDohmNtzCSSIRAR9SBqh4G
         lIK1bYg3GKPtCgr0yA+iMVb073cRRqNDNGazvgzH0mIkoLbWkXvtLx0Bl5p8w3XfWLNx
         TAPA==
X-Gm-Message-State: AOAM5323unT4nJn9W6CqZsCKemB6uHsUc/zjFsU4OTB82Y57pLI4oHL5
	5lWqAyUU1DNBhV3ss7gvixaNEm2IBsM=
X-Google-Smtp-Source: ABdhPJyAUc/k0qvluyEC2VYLwJH8qpFo/KvQ5d3sTt1Cud8N1mJkJMlP36aTnFKhGVFqoj5MGqGjlQ==
X-Received: by 2002:a17:906:e50:: with SMTP id q16mr1196904eji.370.1631336908634;
        Fri, 10 Sep 2021 22:08:28 -0700 (PDT)
Received: from localhost.localdomain (host-79-43-5-131.retail.telecomitalia.it. [79.43.5.131])
        by smtp.gmail.com with ESMTPSA id b8sm318631edv.96.2021.09.10.22.08.27
        for <linux-staging@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Sep 2021 22:08:27 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: linux-staging@lists.linux.dev
Subject: Re: Invitation: [PATCH] staging: rtl8723bs: remove possible deadlock when... @ Sat 2021-09-11 05:30 - 06:30 (CEST) (linux-staging@lists.linux.dev)
Date: Sat, 11 Sep 2021 07:08:26 +0200
Message-ID: <5116308.oHh0xFfCDu@localhost.localdomain>
In-Reply-To: <0000000000003e20a705cbaf90c0@google.com>
References: <0000000000003e20a705cbaf90c0@google.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="ISO-8859-1"

On Saturday, September 11, 2021 5:09:43 AM CEST fmdefrancesco@gmail.com 
wrote:
> You have been invited to the following event.
> 
> Title: [PATCH] staging: rtl8723bs: remove possible deadlock when disconnect

Sorry, please disregard this invitation. I inadvertently messed up with my 
Google Calendar.

Thanks,

Fabio


