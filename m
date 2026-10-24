Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792863903;
	b=L4InSeJseOdAEmAOu+EzytRAuEgN7Tij7bROJqLimIJdoe5trSg0/dq49U2GJndRmwCu
	 BYax1Z/Q5/sg+2tvzDFEsoTOPOaiMDLDqhSVeVCzMq9oRiEdIX7IYVSjwVf5U8m372s09
	 211azDsB+qZxeZw/E3N983b2LdtkKuxUcpvV/w8N0S22oBghY6RDpZAMJztqY/6dNzAqa
	 qqMezuDAIAd1/iYlVbqZREaDg15ar9dsNsdDzlHKW95SAyQnCGuVXgD9oDUbwu/XjMKYW
	 N+1/PC6lrMpT+E6MCjtmBGBdf/LuNN4JUEMkna30Un52QXCZj+NBgoyoT5qIKqORcjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792863903;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=nn33RrLK2jP6yegXcMbyk7CADovV75ox65AHlodMd48=;
	b=DdtnWfgKXNx9uv62T8/F9odoCpOJDFz0gYRr38SPYAPuwntC9okuLe+sQaVKAhwKPHC4
	 npjwdPBtHhQRpnJj5HxQ/XiKLifDpvU4MCFz5OVkrXi3UxDoBjR4eDQcpEZNSV33lOXWx
	 DrJh05GpguQcowziBY2m8uc+Kzws3qMvtfwXjlHnkXXnMpGdr8Xta9rOJ/DVlEEpWJnsq
	 VbIpTAMTBkL7IJVzxMX9TpwVnyBKpEzHWmsIN1fitBK/HMPNZxyRfTvLfcR7VygcKL+9D
	 dS1VIAH3iBWjzJNOM1+7HzU7LFXiZFLhT7VY1Qbntwa67mTyLb+6uGXLuxTlkS1MbVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EXIq6mjn;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE123606A325
	for <linux-staging@lists.linux.dev>; Sat, 24 Oct 2026 17:45:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE123606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EXIq6mjn
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48df8fe8513so1657317f8f.0
        for <linux-staging@lists.linux.dev>; Sat, 24 Oct 2026 10:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792863901; x=1793468701; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nn33RrLK2jP6yegXcMbyk7CADovV75ox65AHlodMd48=;
        b=EXIq6mjnkWa8EHUEOOLjDQhjdUwAjsm0dVEGb35rx5MsCovKWmQg4lw7iHICqdMQr0
         +HMIeBtpGTG5/s1oexwXU60h1dniQHYmDVASyb22AvAsh+U4TA0q1yfvN66EAlyI0X4H
         rBl6Hm0IyQjBJlbgoxLGNasI/EijgFRkmy3W7LeJZ4ctl4rLPgxL4Q0ARJjUDJM0Wx0i
         20gNnzGC+TEOznbe/44c1goyItVijzABLuin3qUSk/sPDtDNHafsAXv6vHluc7dLPy/z
         PrI5bwADwWN842tab615dhLeInNIjsoHUElD48qU3wwM0JIVjDd5d6VaaI2vagUgDENZ
         y3lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792863901; x=1793468701;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nn33RrLK2jP6yegXcMbyk7CADovV75ox65AHlodMd48=;
        b=aR6pKXOZ74rzl2QVJKDZlcDoRmFT2HCIxjLboUkliBfJaPg4xqL2ULSMm5leUy2g40
         6dAeEQf5xcJJZ73cHlAEqGQ00nWesVh4qBPIVHSPcJwAyEmSlp5SsuTGN/aUFuFmgaPa
         ju7UzZQPS1EMLkF41A3KZLeXdNbtM/EIKS3jNS0SAqHVCoB4SIS5Bm6QPnyGLLPv+caE
         Fn64NjNy+73EhKWC2AoVRHb7VM2mDcS37fND8He7U9RXl5l1/Si28IEQC335pxgRJYJH
         u4RP3EvFKrA+A51XZ8n5ggMpAjwA+2q01jfG6RVQW83YEwQ/ob0+Yy4gEX+3IlzueeyM
         /Nwg==
X-Forwarded-Encrypted: i=1; AKwUvBwbHyCMoaCGS5ZLuPD/tf5IYpH2Q43zTNMPEOJvPGUa7VRWOTPg+dxvHqixf+JU1dADJpoXCatFXsNRcQFw@lists.linux.dev
X-Gm-Message-State: AFq9FYINFsYu+YzVSP5JjojKP7mnQOTDSJcGLssONtx2MgOj0vXCzaoY
	hlOuebUDhysHMlJcSGuyibsXcyOkujVHyRQsPVueAQ9Y43jxPv5YaYFM
X-Gm-Gg: AYBFou0YMADnJbSpwuF5fRSA9tFp7fdaUR+TMz5QVaLe8yLdPdQb7bwOiMSGAi2ykxc
	ZcrBpwahy5s0LeMJ8fLSRlGjLn58PPEf9zmKHIP0gaT85bpThawXpz/XgEjOxiqP3g3YTijpW+I
	08sCCgqaasUItz0oiAlPd/7vjodCHxWnIsK2gbqNkrIw/fbmr1OG397FdmLvpP7Tsm6seoteZK7
	ID66TzZkVdZm6UKEVlV3xv0Gto0V2bfSBGdTs1wOY3NWWjSnGNgkCVrnNIK2/uBkB+yulKSv5cz
	4PQov50pWUaj3Aw/OTWdW1TkbQDwefWvjn9ZUYr1Y/ipfRvIfJyax6uRuLMwqMlAqjuHFHiVGnF
	UtR6p1ipgwN2td+PxugRQRMFXLMk7WEFUUwcJuJ2VIiNRtOUESmcvlltFVO1Blk5uICSZX5DX9+
	w69AG6p1s1WJ1yBaSpLaM/jMGp6TMw222/1xg1G7H8Uga0fOPwTb5LM2xxAbBmGKFKApHmtJNkD
	MpyLzqh9pUb2Go66Ck8h/6hXlSkwVUjyXuKp4OP7Hk9n+yQbGzf+IwHDfDKvnqC1VVhpTzEisX1
	jmV6tGiQLe8DlO7P3eqv9AsPh00=
X-Received: by 2002:a05:6000:178d:b0:48e:75f:477d with SMTP id ffacd0b85a97d-48e3eb262f0mr3872646f8f.7.1792863900975;
        Sat, 24 Oct 2026 10:45:00 -0700 (PDT)
Received: from john-desktop.station ([93.107.83.127])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb8d5sm5748244f8f.28.2026.10.24.10.44.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 10:45:00 -0700 (PDT)
From: John O'Callaghan <johnocallaghan@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-amlogic@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] media: meson: vdec: reset the VLD before H.264 decoding
Date: Sat, 24 Oct 2026 18:44:36 +0100
Message-ID: <20261024174436.1835068-1-johnocallaghan@gmail.com>
X-Mailer: git-send-email 2.50.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The H.264 decoder outputs wrong luma until the second IDR picture of a
stream. Chroma is correct. The top-left macroblocks of the first IDR
picture hold garbage that is different on each run. Intra prediction
spreads the error over the picture, and inter prediction carries it to
the following pictures.

vdec_1_start() resets the VDEC1 blocks with DOS_SW_RESET0 before it
powers on the VDEC memories with DOS_MEM_PD_VDEC. The VLD then starts
in an undefined state. The vendor driver resets the VLD, IQIDCT and MC
again in vh264_prot_init(), after the memories are on. This driver
does not.

Reset the VLD (DOS_SW_RESET0 bit 4) in codec_h264_start(). The VLD
reset alone fixes the corruption. The other resets that the vendor
driver does (IQIDCT, MC, DBLK, PIC_DC) make no difference.

On G12A, every decode session is affected. On GXBB, only the first
session after power-on is affected.

Fixes: d7647e7c90f5 ("media: meson: vdec: add H.264 decoding support")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: John O'Callaghan <johnocallaghan@gmail.com>
---
How this patch was made: the bug was found and the fix written with an
LLM coding assistant (Claude Code). I reviewed the fix and ran every
test below on my boards. checkpatch is clean; W=1 and sparse give no
new warnings.

Users see this bug in normal playback. On G12A, every H.264 video plays
with the wrong brightness until the second IDR picture: the first
8 seconds of my test clip, with a band 72 levels too bright on the left.

Tested with H.264 High profile clips (1080p and 720p, 600 frames, IDR
every 250 frames), GStreamer 1.26 (v4l2h264dec) and FFmpeg 7.1
(h264_v4l2m2m). Every decoded frame was compared by MD5 with the FFmpeg
software decoder.

Radxa Zero (S905Y2, G12A), Armbian kernels 6.18.45 and 7.3, staging
vdec with Armbian's patches:
- before: frames 0-249 wrong in every run (10 of 10)
- after:  all 600 frames bit-exact (32 of 32 runs)

Odroid C2 (S905, GXBB), Armbian kernel 6.18.44:
- before: frames 0-249 wrong in the first decode after power-on,
  later decodes bit-exact
- after:  bit-exact, including the first decode after power-on

Odroid C2, plain v7.3 (no out-of-tree vdec patches), GStreamer:
- before: frames 0-249 wrong in the first decode after power-on
- after:  bit-exact. Two GStreamer starts failed first with the known
  poll() start race, so the decoder had already run before this decode.
(v7.3 also drops the second-to-last frame at the end of the stream.
That is a separate bug and is not addressed here.)

The DOS_SW_RESET0 bits were tested one at a time: only bit 4 (VLD)
changes the result.

Not tested: GXL, GXLX, GXM, SM1, interlaced streams, 4K. On G12A the
tests ran on Armbian kernels; their vdec patches do not touch
codec_h264_start().

The same fix is in Armbian:
https://github.com/armbian/build/pull/11098

 drivers/staging/media/meson/vdec/codec_h264.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/staging/media/meson/vdec/codec_h264.c b/drivers/staging/media/meson/vdec/codec_h264.c
index a6074de15..497fbada6 100644
--- a/drivers/staging/media/meson/vdec/codec_h264.c
+++ b/drivers/staging/media/meson/vdec/codec_h264.c
@@ -182,6 +182,14 @@ static int codec_h264_start(struct amvdec_session *sess)
 	if (!h264->sei_vaddr)
 		return -ENOMEM;
 
+	/*
+	 * vdec_1_start() resets the VLD before the VDEC memories are powered
+	 * on. Reset it again, or the luma of the first pictures is corrupt.
+	 */
+	amvdec_write_dos(core, DOS_SW_RESET0, BIT(4));
+	amvdec_write_dos(core, DOS_SW_RESET0, 0);
+	amvdec_read_dos(core, DOS_SW_RESET0);
+
 	amvdec_write_dos_bits(core, POWER_CTL_VLD, BIT(9) | BIT(6));
 
 	workspace_offset = h264->workspace_paddr - WORKSPACE_BUF_OFFSET;
-- 
2.50.1

