Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BD1A1FAE;
	Fri, 28 Oct 2022 08:36:11 +0000 (UTC)
Received: by mail-qk1-f181.google.com with SMTP id t25so2997241qkm.2;
        Fri, 28 Oct 2022 01:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9Y1p+qlCnBvED9zzTgvEOAvn502VsmGTh3U1RRB9d4M=;
        b=Ih3yYh9FIJXwEuCshZuNKX/cwFfmlEZRmef7ihrBclwuNPvkIm50GzcGBi+SXi3CNi
         j9A7byZVlFMtYx6LiOMrEukdU26TWj5WzQXnQb5H1PX5DUBVRS0wk7y6YzZlQnGNhnKt
         u5B8kNiUGFrHurNUMWeU6F++3LOA0BNNzP+FR/ymOd8CJKKyhChg+QAGYjeF1qyK5eun
         woqKcvlEe5Dcm4cDQrEDYQJUxeR0pg0U9bBzAPVDMYxdW+BSq3sHzkQwwN7VtDL1fCng
         bRRqp3rJJ1nwruNszDvZjSHCQA9vT53UcgHMozpztEb+bOz50XwPk/77mn6orkT8lip4
         MeYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9Y1p+qlCnBvED9zzTgvEOAvn502VsmGTh3U1RRB9d4M=;
        b=G/K8w9TQfDPWMjnJvlbfeIsjzCnUKB1+et9gj/y2z7eQuSy3oO+rIy2GTzU0Y5BGJi
         ninDJFBguU5Haf99qQkdFaLFwVJiIB1KK0IUe2RvHa3kN5klYYYPNSDmKnvF3tlGgV/C
         EI0wG3XoXdan9j4g6p0Wedl/LPwTd55zcMJgOytu/R6RV8A3nn2vlD7vdzWSiqwxIluw
         GxTC/XJKvYposfOw1981U6ZjgT+lIVInxXvd1MXNvMlcClVKce+xaF8w7L8bDDDPn+F1
         sqrzTC4rGVvJ/+xmfB6p1Zf5XnaHcSCl6GQj/IWibvNtuwDCXSPUSR3wzcego7DAVOX2
         ZOCw==
X-Gm-Message-State: ACrzQf3D/Qt3dTABF59y9xpB8Zm11Oni2PSuoV9SdVtYvdRw5XxQxRGr
	djuGpinXfrJ6zXtpp3AJBM9mYSmt54CkXnxepNRz4NxIoZTfcCDc
X-Google-Smtp-Source: AMsMyM4v8P3eh9JcJMr/U6H9IOtksx0ADf18qvqW7OJhHTf4xyBA1TEwmH2d/EJyqYcj4+SLfNk9iUprf9VUwVrtYtM=
X-Received: by 2002:a05:622a:147:b0:39c:dc0d:7d0f with SMTP id
 v7-20020a05622a014700b0039cdc0d7d0fmr43237667qtw.281.1666946159569; Fri, 28
 Oct 2022 01:35:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Tanju Brunostar <tanjubrunostar0@gmail.com>
Date: Fri, 28 Oct 2022 09:35:48 +0100
Message-ID: <CAHJEyKU8YhVLg2k4c6H_B9YJo=Va=V8ea+vkgDKH8aUZBou0wA@mail.gmail.com>
Subject: Outreachy first patch wiki modification proposal
To: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	outreachy@lists.linux.dev, Julia Lawall <julia.lawall@inria.fr>
Content-Type: text/plain; charset="UTF-8"

After setting up my mutt with Gmail, I tested it by sending an email
but it did not go through. After some research, I realized that Gmail
no longer allows less secure apps. The way around this is to set up
two step verification, then generate and use "App password". I would
like to add this to the wiki, as this will save others from the
additional work. Please let me know if I can proceed.

Thanks,

Tanju
