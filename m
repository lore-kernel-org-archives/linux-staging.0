Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7868229CA
	for <linux-staging@lists.linux.dev>; Mon, 25 Oct 2021 14:32:05 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id p14so7254068wrd.10
        for <linux-staging@lists.linux.dev>; Mon, 25 Oct 2021 07:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IIGRvhXmp/ODidkCDs+qSECALH/6ezkCoaRxNQbD8+M=;
        b=PuA9ttglf9ol8ctfnt2c1N7mXBmSb7L2A0tTnjH70sDRFU5XpU+WY9UPb0Y7pVjknG
         Ici7wgBsyKjTxQiVO0KvRxrC5a3JkeNJfjv6pyXoakHiiyemnQQXZcEjvJg46RUth5Ym
         eCWWxxhhJozVftBqn2f5DqfMjBRCoTAURCin9JIW/el1MKvkSnHjRY95fInzg4UB/7aX
         jzuPZr+a83uwEsCAQEo3eIVUMZIdobsNFT6czFmAn9tGclc4uKQA21MIrqAtO8BdhW/w
         oqrfIWRGR5eIsR0vH/9rvi0oyLb550TML9i860qOBWMUTPMQOVgwuj84T4U925afc5IK
         QGSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IIGRvhXmp/ODidkCDs+qSECALH/6ezkCoaRxNQbD8+M=;
        b=gNwC9iI3vwheUJomLirH95g3Nqzw2aFqNGz2QMYMYEk/OQ56qlB1Pml9EaCbsaBkK3
         cKNyPdZSWiaNghsAlRR3n1oa3iQGQD9SIEIgx0OMrkDtjmIrzEnmNaRmaDy8gaisq6C8
         CNWrcUJBlggvYKrZ93ldhY9sgW95P64/tZnF90X487bzLp7hCfmfgejP5uFPfvY24PQI
         IG9OcQak5MuFxnP8ZGOeiDgEzh8LYyfumSbXv5gYyvjE2tKth8LUzc6DhHEY2wmLzKOe
         0gTpkdpcibaaeH3EELQMXwPze2pcC0t1q11XDIzvVEDI5Qfdxbqb1byEP8PxINyfz9cU
         eN5Q==
X-Gm-Message-State: AOAM531TPVvfML2YpCUL8//4AWfSwV6MNOiR5r/BrAvpq8NM8D78u/RL
	xWkFSWtdPik/bZxCYt2naog=
X-Google-Smtp-Source: ABdhPJxeSMHkprsiBO0a8tVDkozdP5fElEXvnQrPcy4zvyEYPgDM1j6mikQ1YNf8nJchkLecYi88Gg==
X-Received: by 2002:adf:c78d:: with SMTP id l13mr23111243wrg.134.1635172323900;
        Mon, 25 Oct 2021 07:32:03 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4b00:f411:e700:e085:8cb7:7bf6:5d62])
        by smtp.gmail.com with ESMTPSA id x8sm13011500wrr.53.2021.10.25.07.32.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Oct 2021 07:32:03 -0700 (PDT)
From: Karolina Drobnik <karolinadrobnik@gmail.com>
To: outreachy-kernel@googlegroups.com
Cc: gregkh@linuxfoundation.org,
	forest@alittletooquiet.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Karolina Drobnik <karolinadrobnik@gmail.com>
Subject: [PATCH 0/8] staging: vt6655: Rename channel, init and power tables
Date: Mon, 25 Oct 2021 15:31:26 +0100
Message-Id: <cover.1635171518.git.karolinadrobnik@gmail.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch set renames global arrays of settings for AL2230 and AL7320
transceivers so they adhere to the kernel coding style. It includes removal 
of the Hungarian notation and changing variable names to use snake case.

Karolina Drobnik (8):
  staging: vt6655: Rename `dwAL2230ChannelTable0` array
  staging: vt6655: Rename `dwAL2230ChannelTable1` array
  staging: vt6655: Rename `dwAL7230ChannelTable0` array
  staging: vt6655: Rename `dwAL7230ChannelTable1` array
  staging: vt6655: Rename `dwAL7230ChannelTable2` array
  staging: vt6655: Rename `dwAL7230InitTableAMode` array
  staging: vt6655: Rename `dwAL2230PowerTable` array
  staging: vt6655: Rename `dwAL7230InitTable` array

 drivers/staging/vt6655/rf.c | 76 ++++++++++++++++++-------------------
 1 file changed, 38 insertions(+), 38 deletions(-)

-- 
2.30.2

