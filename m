Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D062D184F
	for <linux-staging@lists.linux.dev>; Mon, 13 Mar 2023 04:55:17 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id q16so10088502wrw.2
        for <linux-staging@lists.linux.dev>; Sun, 12 Mar 2023 21:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678683316;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zp3ofHoONwt43Lfi5ZwTAJ8DiKIiYOSsMfYFCAAYeDk=;
        b=Nm5R9gRnQc6vf0SAea9CmMhuYv3czapS4TiPXvyhgD8Zi95tlnjzt7TsaWEjj9TF/c
         oY10ev9XSaq9ATQS4SxI/0UlxXZnfm/BqVRoV5JI4N05dN5J/qLYvHCOtN5u0+OpjxhL
         bNYxriKIRej1BO7rhU/2DD3+JQK8ugbZAGE408fW92MovlxwXu38ckad4Q460mcnu9ar
         vAscONzI3PjdsNQPUltNNRl5FZzJ260G0MvFBiM2S24vWMr3btjY5WBp1DqgDrETazTH
         a0cuO1DIm+xOnUJZ8DDJ3tHD2jIi4c/kHQ4AIY8MQV78MHW6+yuXxXyDLc1Dq80EWOp0
         Iycg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678683316;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zp3ofHoONwt43Lfi5ZwTAJ8DiKIiYOSsMfYFCAAYeDk=;
        b=V0MHi9RzeyBH9V5hQdGlxg5h+bUKop8HvB8RRtDHX6zBEMnI8ydGST0vF5G7h0JEoy
         ObluVA5WGS6J7dAf+xW9xScWx1Yce/J8PQwe2wJAEsITSd9IMQ9+WiP+9uMFu5A2UEWr
         kkmDMcz1NPIf2WyBjH2KaXGrXjABmFSU3P/MxE5TtvC62u0dP7mIX2HXrq8QdUbrRS4S
         zTtlddKwFhiQlxovVfVKt1TiW9PB/zjE2VptGHysbPNZMPZ9/wwu/nVxC8dF1eAdCtWB
         xfl3VhUhl45qPJapXA5hBgWj2wRmws9r5uRUuoqV5PY0io++JvJR/zb1RyqwifU08SfH
         v+vw==
X-Gm-Message-State: AO0yUKXFjzk9Vj8NBIRENB4ios3jpNJ9RZvm3LkewO1cdVVkkA5JXjCG
	3pqk89barX79bfz/6D33IV0=
X-Google-Smtp-Source: AK7set8hFYIqyB+wzu9yJz7taWP4OoxdzEHmnNVkBX3ilfZLDyXjlJF1T+tBZqELmFyLRGRvY64+3Q==
X-Received: by 2002:adf:e40b:0:b0:2ce:e571:5cc7 with SMTP id g11-20020adfe40b000000b002cee5715cc7mr1422502wrm.56.1678683315990;
        Sun, 12 Mar 2023 21:55:15 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id a18-20020adffad2000000b002ceb7a11eb9sm2249591wrs.42.2023.03.12.21.55.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Mar 2023 21:55:15 -0700 (PDT)
Date: Mon, 13 Mar 2023 07:55:07 +0300
From: Dan Carpenter <error27@gmail.com>
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/12] staging: rtl8192e: Remove unused RF90_PATH_C and
 ..D starting .._phyreg.h
Message-ID: <9da125e9-55f9-40a5-8e35-3d44062eab0a@kili.mountain>
References: <cover.1678569965.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1678569965.git.philipp.g.hortmann@gmail.com>

Looks good!

Reviewed-by: Dan Carpenter <error27@gmail.com>

regards,
dan carpenter

