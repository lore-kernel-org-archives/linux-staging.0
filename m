Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 842CD1103
	for <linux-staging@lists.linux.dev>; Sun, 25 Jun 2023 13:34:14 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-98e1b1d1698so108464266b.2
        for <linux-staging@lists.linux.dev>; Sun, 25 Jun 2023 06:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20221208; t=1687700052; x=1690292052;
        h=to:cc:date:message-id:subject:mime-version
         :content-transfer-encoding:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QT1RnqwHvj1tXJFjyRYSdQKzWzs7kT8eKVRlXXs5/9E=;
        b=YEJLT1SJGObonol5CK4CTVO3r+EdrDofH7+Wasw7GddTeGWHW+1H4maIxIfITpbw0R
         q0mg75Z2MddEdCRyQNbCGukxrvq06ilRZz5GZs40nSPfeP6HKuIIDcImCpRxWAtTc/2I
         n55BMdvaYZJvod3lmT3NMZ4qt/JjO8F5o1nKcz+f8WrtrYNTj2jmkhfgQrY+o3E80qfH
         1ADLOjCfyVYrTDFzV+SxFKz3XDnX3IndFeY5JzuYRQs/DyWk1FVntCm04UTXWq6kl5xe
         1Ej+9AqiOWH5VOrgvYpvvxBu1KYAzwlGoGS7bl84ubS3krjyLQe6ddpz8yUV/Jm8I/Y9
         Qggw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687700052; x=1690292052;
        h=to:cc:date:message-id:subject:mime-version
         :content-transfer-encoding:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QT1RnqwHvj1tXJFjyRYSdQKzWzs7kT8eKVRlXXs5/9E=;
        b=AkNW6qeGOd0+rIlIiOkwvvKa86KaBRvJlklA98Drs749ZwijMo18ppyMQoS9w/odGD
         4pTy3wTU81oR4U+M7RjlTiZYOzYKpS2V5oBjKyzcU4L664bP5Ne9X1xi3jTe9ZGGyxFh
         VKIue3XostjuvrixYDnTxBaV3nbiwqzh1zCVnDJcm2FREtWOKQZPz2mw87Z8/a7xYZJh
         4UX3RVQ5YX6tmQn0jMXkmljYozaaGU8zwvu29fuaBcWzSw3GgwmTFZFaqQwHCe8QD9Kt
         THdXOqWvUwymysSoaBrzuVBzY2pn0yPv+b22RLj1Spvb/4Z+HjwNeTanOj6aXDcAeXqv
         +CDg==
X-Gm-Message-State: AC+VfDxhM6HivkQhdfNypUwG8QWQuo5/RCfa1tBZLUeo8HzrlloBt5rE
	NjEELGsBTmmuyA8L5OiddgY=
X-Google-Smtp-Source: ACHHUZ4Nk/V/R5Gctq/qaYIWSoMcpVdzZe0+WHjLEEtR3lHMbZw08tT5W18d5ho2uHRKET0UqGpp+Q==
X-Received: by 2002:a17:906:db0b:b0:982:6bba:79c9 with SMTP id xj11-20020a170906db0b00b009826bba79c9mr21353854ejb.20.1687700052358;
        Sun, 25 Jun 2023 06:34:12 -0700 (PDT)
Received: from smtpclient.apple ([2a02:810a:9640:26a8:484f:5091:3ba0:ecc])
        by smtp.googlemail.com with ESMTPSA id n15-20020a05640204cf00b0050bc4600d38sm1766070edw.79.2023.06.25.06.34.11
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 25 Jun 2023 06:34:11 -0700 (PDT)
From: =?utf-8?Q?Franziska_N=C3=A4pelt?= <franziska.naepelt@googlemail.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.600.7\))
Subject: Re: [PATCH v2 0/5] Fix some checkpatch issues
Message-Id: <F9C4E29E-C355-4B08-A2EC-2197A6EB7AFD@googlemail.com>
Date: Sun, 25 Jun 2023 15:33:59 +0200
Cc: eperi1024@gmail.com,
 =?utf-8?Q?Franziska_N=C3=A4pelt?= <franziska.naepelt@gmail.com>,
 Franziska Naepelt <franziska.naepelt@googlemail.com>,
 hdegoede@redhat.com,
 johannes.berg@intel.com,
 linux-kernel@vger.kernel.org,
 linux-staging@lists.linux.dev,
 philipp.g.hortmann@gmail.com,
 quic_vjakkam@quicinc.com,
 tegongkang@gmail.com
To: "<gregkh@linuxfoundation.org>" <gregkh@linuxfoundation.org>
X-Mailer: Apple Mail (2.3731.600.7)

Thanks for your feedback :)
Since not all the patches of my first patch series have been applied, I =
thought I have to submit the whole series again. Submitting a series of =
5 patches, where 3 have been already applied of course fails.
So does it mean, if 3 of 5 patches of a series have been applied and I =
want to submit a new version, I only submit patches for the remaining =
work and not all of them again?

Thanks, Franziska=
