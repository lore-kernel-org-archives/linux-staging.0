Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4440C29CA
	for <linux-staging@lists.linux.dev>; Fri, 19 Nov 2021 12:26:44 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id v1so8640517edx.2
        for <linux-staging@lists.linux.dev>; Fri, 19 Nov 2021 04:26:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BWz0xXDI9+fzW5uta6xg7ju3GS8ia27/5sZwutU+H4U=;
        b=fFKrISg2tuaV5kmhhUJO/se/2mKUB5qioOVAJrNNrgbT4jJHQTWk/uTxpglJfPHZtN
         c47H45Zu1dPX1/vjDfiL9CJ3/Gu6aeRJAlwC8W/bAEQmE5OIOXOaBx92s+Kd/3C7weVS
         AanwHaZ9UiQ65bqE2asexRU2IEVPjUDvmOaEoZ4DzkCl8hBym3Y4FU5EJfXb73y+O22A
         m3Hynq2MMCu8KPqdqbhFYcNO3HxaRPzZMhSedVwzuXGXvOvcHKUwVs1Vs88Yo1OCyXX+
         IFLpLLhl72pQaO1KKt6htSIeq0sGWk8wscqmKmY0zB59vpMQblN3Udn+UF5G2DIhbJVb
         C2XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BWz0xXDI9+fzW5uta6xg7ju3GS8ia27/5sZwutU+H4U=;
        b=PWgxwKKfZJ/KgAjR0ATYXMrY4IAGg+HOtECN/U34WM64Bo/uXGxLwo09HgEb+iy3eL
         85v+KU8wHMe2i6HmjX0iKTAYtVf8iSxtYBJLJ0dr0XRPozTtIUyQUuiC2msdEimuclD3
         aCQFyq6G0SX2SRZBmhCNABwYJfFGhhcaX1iY0cE7pFtc58yrKL5/AmX9mM6UCT8SqXEo
         PddAsAqKW8M05ZYY+9wejMXgUsMVRWSLRZ45sRmLktZVTXirQ/pKnC4exScQ3qvgYAlp
         NAue6k1Buzk9TTClR0VmLc8otIgxlwucU7JdOG5qQyHnTvA4S9DqnE/K6RiHM6ADiOwi
         g+8A==
X-Gm-Message-State: AOAM530RipV2mOKisVRizKTXgON1pU7+MsQ4xOIg+f2tRNEyppdlh33+
	iFWo6dwZxmr88xnOHxAeiJg=
X-Google-Smtp-Source: ABdhPJwRG2DdRACvkK/1eHc9+WGbXJK6dG2M1L2GX5KpL7eEUoF+UrCSXrXaU7gc+XJq2aLEWzVupQ==
X-Received: by 2002:a17:907:3d94:: with SMTP id he20mr7453696ejc.75.1637324802611;
        Fri, 19 Nov 2021 04:26:42 -0800 (PST)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::79b5])
        by smtp.gmail.com with ESMTPSA id v10sm1374994edt.24.2021.11.19.04.26.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Nov 2021 04:26:42 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 0/2] staging: r8188eu: remove more rf_type related dead code
Date: Fri, 19 Nov 2021 13:26:33 +0100
Message-Id: <20211119122635.28435-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This small series removes some more rf_type related dead code.

Michael Straube (2):
  staging: r8188eu: remove rf_type from add_RATid()
  staging: r8188eu: remove rf_type from HT_caps_handler()

 drivers/staging/r8188eu/core/rtw_ap.c        |  7 +------
 drivers/staging/r8188eu/core/rtw_wlan_util.c | 11 ++---------
 2 files changed, 3 insertions(+), 15 deletions(-)

-- 
2.33.1

